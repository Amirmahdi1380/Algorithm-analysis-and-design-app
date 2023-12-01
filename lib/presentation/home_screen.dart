import 'package:algorithm_app/bloc/lessons/lessons_bloc.dart';
import 'package:algorithm_app/bloc/lessons/lessons_event.dart';
import 'package:algorithm_app/bloc/lessons/lessons_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<LessonsBloc>(context).add(LessonsStartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(body: BlocBuilder<LessonsBloc, LessonsState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            if (state is LessonsLoadingState) ...{
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.4),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              )
            } else ...{
              if (state is LessonsResponseState) ...{
                state.getlessons.fold(
                  (l) => SliverToBoxAdapter(child: Text(l)),
                  (r) => SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        var les = r.lessons[index];
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.08), // Shadow color
                                spreadRadius: 1, // Spread radius of the shadow
                                blurRadius: 0.7, // Blur radius of the shadow
                                offset:
                                    const Offset(0, 3), // Offset of the shadow
                              ),
                            ],
                            border: Border.all(
                              width: 0.1,
                              color: const Color(0xff2C2C2C).withOpacity(0.2),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(les.subject),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(les.handouts),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(les.description),
                            ],
                          ),
                        );
                      }, childCount: r.lessons.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 2,
                        childAspectRatio: 0.7,
                      ),
                    ),
                  ),
                )
              }
            },
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 70,
              ),
            )
          ],
        );
      },
    )));
  }
}
