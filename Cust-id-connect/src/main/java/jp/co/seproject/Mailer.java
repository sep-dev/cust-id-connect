package jp.co.seproject;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.smtp.SMTPTransport;

public class Mailer {
	public void sendmail(String to, String subject, String honbun) {
		// メール送信できますよー！
		try {
			// プロパティの設定
			Properties props = System.getProperties();
			// ホスト
			props.put("mail.smtp.host", "smtp.gmail.com");
			// 認証（する）
			props.put("mail.smpt.auth", "true");
			// ポート指定（サブミッションポート）
			props.put("mail.smtp.port", "587");
			// STARTTLSによる暗号化（する）
			props.put("mail.smtp.starttls.enable", "true");

			// セッションの取得
			Session session = Session.getInstance(props);

			// MimeMessageの取得と設定
			Message msg = new MimeMessage(session);
			// 送信者設定
			msg.setFrom(new InternetAddress("testtest@gmail.com"));
			// 宛先設定
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			/* msg.setRecipients(Message.RecipientType.BCC, to); */
			// タイトル設定
			msg.setSubject(subject);
			// 本文設定
			msg.setText(honbun);
			// 送信日時設定
			msg.setSentDate(new Date());

			// 送信
			SMTPTransport t = (SMTPTransport) session.getTransport("smtp");
			try {
				t.connect("smtp.gmail.com", "tarou8503", "8503tarou");// サーバー、id、pw
				t.sendMessage(msg, msg.getAllRecipients());
			} finally {
				t.close();
			}


		} catch (Exception e) {
			e.printStackTrace();

		}
			}

}
