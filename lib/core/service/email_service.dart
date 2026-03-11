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

  Future<EitherOr<Failure, void>> sendUserDeactivatedEmail(String email) {
    return sendEmail(
      toEmail: email,
      subject: "Your Artist Management Account Has Been Deactivated",
      htmlContent: """
    <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; max-width: 600px; margin: auto; padding: 30px; background-color: #f8f9fa; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); text-align: center; color: #333;">
      
      <h2 style="color: #d63031; margin-bottom: 20px;">
        Artist Management Account Deactivated
      </h2>
      
      <p style="font-size: 16px; line-height: 1.6; margin-bottom: 20px;">
        Your account in the <strong>Artist Management System</strong> has been 
        <strong>deactivated by an administrator</strong>.
      </p>
      
      <p style="font-size: 16px; line-height: 1.6; margin-bottom: 30px;">
        If you believe this was done in error or you need your account reactivated,
        please contact our customer support team for assistance.
      </p>

      <a href="mailto:support@artistmanagement.com"
        style="display: inline-block; background: #6c5ce7; color: white; font-weight: bold; padding: 14px 28px; text-decoration: none; border-radius: 8px;">
        Contact Customer Support
      </a>
      
      <p style="margin-top: 40px; font-size: 14px; color: #555;">
        Thank you,<br>
        The Artist Management Team
      </p>
      
    </div>
    """,
    );
  }

  Future<EitherOr<Failure, void>> sendUserRegistrationEmail(String email) {
    return sendEmail(
      toEmail: email,
      subject: "Your Artist Management Account",
      htmlContent:
          """<div style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background:#f4f6fb; padding:40px 20px;">

            <div style="max-width:600px; margin:auto; background:#ffffff; border-radius:14px; padding:40px 30px; box-shadow:0 8px 25px rgba(0,0,0,0.08); text-align:center;">

          ```
          <h1 style="margin:0; font-size:26px; color:#6c5ce7;">
              Artist Management System
          </h1>

          <p style="margin-top:10px; font-size:14px; color:#888;">
            Welcome to the platform
          </p>

          <hr style="border:none; border-top:1px solid #eee; margin:25px 0;">

          <p style="font-size:16px; line-height:1.7; color:#444; margin-bottom:18px;">
            Your account has been successfully created.
          </p>

          <p style="font-size:16px; line-height:1.7; color:#444; margin-bottom:30px;">
            Open the app and sign in using this email to start managing artists and songs.
          </p>

          <a href="artistums://login"
            style="display:inline-block;
            background:#6c5ce7;
            color:#ffffff;
            font-size:16px;
            font-weight:600;
            padding:14px 32px;
            border-radius:10px;
            text-decoration:none;
            box-shadow:0 6px 16px rgba(108,92,231,0.35);">
            Open Artist Management App
          </a>

          <p style="margin-top:35px; font-size:14px; color:#666;">
            If the button above doesn’t work, open the app manually and log in using your email.
          </p>

          <hr style="border:none; border-top:1px solid #eee; margin:30px 0;">

          <p style="font-size:13px; color:#999; line-height:1.6;">
            Thank you for using <strong>Artist Management System</strong> 🎶
            <br>
            — The Artist Management Team
          </p>
          ```

            </div>

          </div>
          """,
    );
  }
}
