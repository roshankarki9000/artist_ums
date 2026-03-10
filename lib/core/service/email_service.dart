import 'dart:convert';

import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/extensions/log_extension.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:http/http.dart' as http;

class EmailService {
  final RepositoryGuard guard;
  final String apiKey;

  EmailService(this.guard, this.apiKey);

  static const String _baseUrl = "https://api.brevo.com/v3/smtp/email";

  Future<EitherOr<Failure, void>> sendEmail({
    required String toEmail,
    required String subject,
    required String htmlContent,
  }) {
    return guard.run(() async {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          "accept": "application/json",
          "api-key": apiKey,
          "content-type": "application/json",
        },
        body: jsonEncode({
          "sender": {
            "name": "Artist Management System",
            "email": "roshankarki9000@gmail.com",
          },
          "to": [
            {"email": toEmail},
          ],
          "subject": subject,
          "htmlContent": htmlContent,
        }),
      );
      response.body.log(type: 'Email Service Log');
      if (response.statusCode != 201) {
        response.logError();
        throw Exception(response.body);
      }
    });
  }

  Future<EitherOr<Failure, void>> sendUserCreatedEmail(String email) {
    return sendEmail(
      toEmail: email,
      subject: "Your Artist Management Account",
      htmlContent:
          """<div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; max-width: 600px; margin: auto; padding: 30px; background-color: #f8f9fa; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); text-align: center; color: #333;">
            
            <h2 style="color: #6c5ce7; margin-bottom: 20px;">Welcome to Artist Management System</h2>
            
            <p style="font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
              Your account has been created by an administrator.
            </p>
            
            <p style="font-size: 16px; line-height: 1.6; margin-bottom: 30px;">
              Please open the application and log in using this email. Your temporary password is: 
              <span style="display: inline-block; font-size: 18px; font-weight: bold; color: #e17055; background-color: #fff3e0; padding: 4px 8px; border-radius: 4px;">
                Test@123
              </span>
              . You will be asked to reset your password when you log in.
            </p>
            
            <a href="artistums://login"
              style="display: inline-block; background: #6c5ce7; color: white; font-weight: bold; padding: 14px 28px; text-decoration: none; border-radius: 8px; transition: background 0.3s ease;">
              Open Artist Management App
            </a>
            
            <p style="margin-top: 40px; font-size: 14px; color: #555;">
              Thank you,<br>
              The Artist Management Team
            </p>
            
          </div>""",
    );
  }
}
