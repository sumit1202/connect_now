import 'package:connect_now/resources/auth_methods.dart';
import 'package:connect_now/resources/firestore_methods.dart';
import 'package:flutter/material.dart';

import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods{

  final AuthMethods _authMethods = AuthMethods();
  final FiresStoreMethods _firesStoreMethods = FiresStoreMethods();

  void createMeeting({required String roomName,
        required bool isAudioMuted,
        required bool isVideoMuted, String username = '',}) async {

    String name;
    if(username.isEmpty){
      name = _authMethods.user.displayName!;
    }else{
      name = username;
    }

    // Define meetings options here
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomName,
      userDisplayName: name,
      userEmail: _authMethods.user.email,
      userAvatarUrl: _authMethods.user.photoURL,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
    );

    _firesStoreMethods.addToMeetingHistory(roomName);
    
    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
                "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
                "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
                "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
                "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () => debugPrint("onClosed"),
      ),
    );


  }
}