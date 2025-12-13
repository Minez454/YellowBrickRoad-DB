import 'dart:convert';
import 'package:http/http.dart' as http;

/* BRICK SERVICE 
   This is the "phone" that the app uses to call the Backend Server.
*/

class BrickService {
  // 1. The Address of the Server
  // For now, this points to your local machine.
  static const String baseUrl = 'http://localhost:3000';

  // 2. The "Check-In" Function
  // The app calls this when the user taps "I'm Overwhelmed"
  static Future<String> sendEmotionalCheckIn(String userId, String mood) async {
    
    // A. Prepare the message
    final url = Uri.parse('$baseUrl/emotional-check-in');
    final message = jsonEncode({
      "userId": userId,
      "mood": mood,
      "notes": "User tapped the quick check-in button"
    });

    try {
      // B. Send the message (POST request)
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: message,
      );

      // C. Listen for Brick's reply
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message']; // e.g., "I hear you. Want Burnout Mode?"
      } else {
        return "Brick is having trouble connecting right now.";
      }
    } catch (e) {
      return "Error: Could not reach Brick.";
    }
  }
}
