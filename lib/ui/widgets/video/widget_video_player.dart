import 'package:flutter/material.dart';
import 'package:fmp_common/fmp_common.dart';
import 'package:video_player/video_player.dart';

class WidgetVideoPlayer extends StatefulWidget {

  final VideoPlayerController controller;
  final List<Widget> trailing;

  const WidgetVideoPlayer({
    Key? key,
    required this.controller,
    this.trailing = const [],
  }) : super(key: key);

  @override
  State<WidgetVideoPlayer> createState() => _WidgetVideoPlayerState();
}

class _WidgetVideoPlayerState extends State<WidgetVideoPlayer> {

  Color ICON_COLOR = Colors.white.withAlpha(230);


  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });
  }

  void _playPause() async{
    if(widget.controller.value.isPlaying){
      await widget.controller.pause();
    }else{
      await widget.controller.play();
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Tappable(
          onTap: _playPause,
          child: VideoPlayer(widget.controller)
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            VideoProgressIndicator(widget.controller, allowScrubbing: true),
            Container(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:  [
                            IconButton(
                                onPressed: _playPause,
                                icon: widget.controller.value.isPlaying
                                    ? Icon(Icons.pause, color: ICON_COLOR,)
                                    : Icon(Icons.play_arrow_rounded, color: ICON_COLOR,)),
                            /*IconButton(
                              onPressed: () async{
                                await widget.controller.seekTo(Duration.zero);
                              },
                              icon: Icon(Icons.replay, color: ICON_COLOR,),
                            ),*/
                            SizedBox(width: 8,),
                            VideoPlayerDurationText(controller: widget.controller, color: ICON_COLOR,),
                            SizedBox(width: 16,),
                            VideoPlayerSoundSlider(controller: widget.controller, color: ICON_COLOR,),
                          ],
                        )
                      ),
                    )
                    ] + widget.trailing,
                  ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class VideoPlayerSoundSlider extends StatefulWidget {

  VideoPlayerController controller;
  Color color;

  VideoPlayerSoundSlider({
    Key? key,
    required this.controller,
    required this.color,
  }) : super(key: key);

  @override
  State<VideoPlayerSoundSlider> createState() => _VideoPlayerSoundSliderState();
}

class _VideoPlayerSoundSliderState extends State<VideoPlayerSoundSlider> {

  double defaultVolume = 0.5;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {});
    });

    if(widget.controller.value.volume != 0){
      defaultVolume = widget.controller.value.volume;
    }
  }


  void _sliderVolumeChanged(double value) {
    if(value >= 0.2) {
      defaultVolume = value;
    }
    widget.controller.setVolume(value);

  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () async{
              if(widget.controller.value.volume == 0){
                await widget.controller.setVolume(defaultVolume);
              }else{
                await widget.controller.setVolume(0);
              }
              setState(() {});
            },
            icon: Icon(
              widget.controller.value.volume == 0
                  ? Icons.volume_off
                  : Icons.volume_up,
              color: widget.color,),
          ),
        ),
        SizedBox(
          width: 128,
          child:   SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2.0,
            ),
            child: Slider(
              activeColor: widget.color,
              inactiveColor: widget.color.withAlpha(100),
              thumbColor: widget.color,
              value: widget.controller.value.volume,
              onChanged: _sliderVolumeChanged,
            ),
          ),
        ),
      ],
    );
  }
}


class VideoPlayerDurationSlider extends StatefulWidget {

  VideoPlayerController controller;
  Color color;

  VideoPlayerDurationSlider({Key? key, required this.controller, required this.color}) : super(key: key);

  @override
  State<VideoPlayerDurationSlider> createState() => _VideoPlayerDurationSliderState();
}

class _VideoPlayerDurationSliderState extends State<VideoPlayerDurationSlider> {

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.controller.value.position.inMilliseconds.toDouble(),
      min: 0,
      max: widget.controller.value.duration.inMilliseconds.toDouble(),
      onChanged: (value) {

      },
      onChangeEnd: (value) async{

        await widget.controller.pause();
        await widget.controller.seekTo(Duration(milliseconds: value.toInt()));
        await widget.controller.play();

      },
    );
  }
}


class VideoPlayerDurationText extends StatefulWidget {

  VideoPlayerController controller;
  Color color;

  VideoPlayerDurationText({Key? key, required this.controller, required this.color}) : super(key: key);

  @override
  State<VideoPlayerDurationText> createState() => _VideoPlayerDurationTextState();
}

class _VideoPlayerDurationTextState extends State<VideoPlayerDurationText> {


  String getDurationText(){
    Duration duration = widget.controller.value.duration;
    Duration position = widget.controller.value.position;

    return "${durationToString(position)} / ${durationToString(duration)}";

  }
  String durationToString(Duration duration){
    int seconds = duration.inSeconds.remainder(60);
    String str = seconds < 10 ? "0$seconds" : "$seconds";
    return "${duration.inMinutes}:$str";
  }

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getDurationText(),
      style: TextStyle(color: widget.color),
    );
  }
}

