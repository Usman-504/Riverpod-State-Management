import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/slider_provider.dart';

class SliderView extends ConsumerWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build1');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('RiverPod'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              debugPrint('container');
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Container(
                height: 200,
                width: 200,
                // ignore: deprecated_member_use
                color: Colors.red.withOpacity(slider),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              debugPrint('eye');
              final slider = ref.watch(
                sliderProvider.select((state) => state.password),
              );
              return InkWell(
                onTap: () {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    password: !slider,
                  );
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Icon(
                    slider ? Icons.remove_red_eye : Icons.visibility_off,
                  ),
                ),
              );
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              debugPrint('Slider');
              final slider = ref.watch(
                sliderProvider.select((state) => state.slider),
              );
              return Slider(
                value: slider,
                onChanged: (value) {
                  final stateProvider = ref.read(sliderProvider.notifier);
                  stateProvider.state = stateProvider.state.copyWith(
                    slider: value,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
