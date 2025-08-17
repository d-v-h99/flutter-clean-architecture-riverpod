import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/dashboard_state_provider.dart';
import 'package:flutter_project/features/dashboard/presentation/providers/state/dashboard_state.dart';
import 'package:flutter_project/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:flutter_project/features/product_detail/presentation/screen/product_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

@RoutePage()
class DashboardScreen extends ConsumerStatefulWidget {
  // static const String routeName = 'DashboardScreen';
  final String? fullName;
  const DashboardScreen(this.fullName, {Key? key}) : super(key: key);

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool isSearchActive = false;
  Timer? _debounce; //để debounce search (đợi người dùng dừng nhập mới gửi request).

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void scrollControllerListener() {
    //Khi scroll tới cuối ListView (cuộn hết), gọi API load-more:
    // Nếu đang search thì search tiếp,
    // Nếu không thì fetch sản phẩm tiếp.
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      final notifier = ref.read(dashboardNotifierProvider.notifier);
      if (isSearchActive) {
        notifier.searchProducts(searchController.text);
      } else {
        notifier.fetchProducts();
      }
    }
  }

  void refreshScrollControllerListener() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);//Theo dõi state của dashboard (sẽ rebuild khi state thay đổi).

    //Nếu fetch xong toàn bộ sản phẩm (fetchedAllProducts) và có message thì hiện SnackBar.
    // Dùng lắng nghe (listen) để không rebuild UI mà chỉ thực thi side-effect (hiện SnackBar).
    ref.listen(
      dashboardNotifierProvider.select((value) => value),
      ((DashboardState? previous, DashboardState next) {
        //show Snackbar on failure
        if (next.state == DashboardConcreteState.fetchedAllProducts) {
          if (next.message.isNotEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(next.message.toString())));
          }
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                controller: searchController,
                onChanged: _onSearchChanged,
              )
            : const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              searchController.clear();
              setState(() {
                isSearchActive = !isSearchActive;
              });

              ref.read(dashboardNotifierProvider.notifier).resetState();
              if (!isSearchActive) {
                ref.read(dashboardNotifierProvider.notifier).fetchProducts();
              }
              refreshScrollControllerListener();
            },
            icon: Icon(
              isSearchActive ? Icons.clear : Icons.search,
            ),
          ),
        ],
      ),
      drawer: const DashboardDrawer(),
      body: state.state == DashboardConcreteState.loading
          ? const Center(child: CircularProgressIndicator())
          : state.hasData
              ? Column(
                  children: [
                    if(widget.fullName != null)
                    Text("Xin chào + ${widget.fullName}",style: TextStyle(fontSize: 20),),
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        child: ListView.separated(
                          separatorBuilder: (_, __) => const Divider(),
                          controller: scrollController,
                          itemCount: state.productList.length,
                          itemBuilder: (context, index) {
                            final product = state.productList[index];
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(product.thumbnail)),
                              title: Text(
                                product.title,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              trailing: Text(
                                '\$${product.price}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              subtitle: Text(
                                product.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: (){
                                context.router.push(ProductDetailRoute(id: product.id));
                                // AutoRouter.of(context).push(ProductDetailRoute(id: product.id));

                              },
                            );
                          },
                        ),
                      ),
                    ),
                    if (state.state == DashboardConcreteState.fetchingMore)
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: CircularProgressIndicator(),
                      ),
                  ],
                )
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
    );
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(dashboardNotifierProvider.notifier).searchProducts(query);
    });
  }
}
