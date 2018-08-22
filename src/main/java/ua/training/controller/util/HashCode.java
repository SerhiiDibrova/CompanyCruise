package ua.training.controller.util;

import org.apache.log4j.Logger;

import javax.xml.bind.DatatypeConverter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashCode {

    private final static Logger logger = Logger.getLogger(HashCode.class);
    public static String getHashCodeSha1(String input) {
        String sha1 = null;
        try {
            MessageDigest msdDigest = MessageDigest.getInstance("SHA-1");
            msdDigest.update(input.getBytes("UTF-8"), 0, input.length());
            sha1 = DatatypeConverter.printHexBinary(msdDigest.digest());
            logger.info("Succes Hashcode password --->"+ sha1);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            logger.error(e.toString());
        }
        return sha1;
    }
}
