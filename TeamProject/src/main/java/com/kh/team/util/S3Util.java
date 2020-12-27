package com.kh.team.util;

import java.io.ByteArrayInputStream;
import java.io.File;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;

public class S3Util {
	
	private String accesskey = "AKIAILROFRBXY6ZXO4DQ";
	private String secretkey = "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";
	
	private AmazonS3 conn;
	
	public S3Util() {
		AWSCredentials credentials = new BasicAWSCredentials(accesskey, secretkey);
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint("s3.ap-northeast-2.amazonaws.com");
	}
	
	//���� ���ε�
	public void fileUpload(String bucketName, String fileName, byte[] fileData) throws Exception {
		String filePath = (fileName).replace(File.separatorChar, '/');
		ObjectMetadata metaData = new ObjectMetadata();
		metaData.setContentLength(fileData.length);
		ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData);
		
		conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);
	}
	
	//���� ����
	public void fileDelete(String bucketName, String fileName) throws Exception {
		String imgName = (fileName).replace(File.separatorChar, '/');
		conn.deleteObject(bucketName, imgName);
	}
	
	//���� URL
	public String getFileURL(String bucketName, String fileName) throws Exception {
		String imgName = (fileName).replace(File.separatorChar, '/');
		return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, imgName)).toString();
	}
	
	
}
