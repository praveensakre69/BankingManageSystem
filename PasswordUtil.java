package Operations;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
public class PasswordUtil 
{
	public static String generateSalt() {
		SecureRandom random = new SecureRandom();
		byte [] salt = new byte[16];
		random.nextBytes(salt);
		return bytesToHex(salt);
		
	}
	
	public static String hashPassword(String password, String salt)
	{
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update((password+salt).getBytes());
			byte [] hashedBytes = md.digest();
			return bytesToHex(hashedBytes);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("Error hashing password");
		}
	}
	private static String bytesToHex(byte [] bytes)
	{
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) 
		{
			sb.append(String.format("%02x", b));
			

			
		}
		return sb.toString();
	}

}
