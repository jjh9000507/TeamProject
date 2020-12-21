package com.kh.team.controller;

import java.io.FileInputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsFileUploadSupport;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

@Controller
public class JoinController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
		//return "/joinForm";
		return "joinForm";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		//return "/joinForm";
		return "map";
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {	
		//return "/joinForm";
		return "joinForm";
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(/*@RequestParam("fileName")*/ String fileName) throws Exception {
		
		byte[] bytes = null;
		
		if((fileName != null) && !fileName.equals("") ) {
		FileInputStream fis = new FileInputStream(fileName);
		// org.apache.commons.io.IOUtils
		bytes = IOUtils.toByteArray(fis);
		}
		return bytes;
	}
	
	@RequestMapping(value="/getAddress", method = RequestMethod.GET)
	public String getAddress(String txtAddress) throws Exception{
				
		System.out.println("txtAddress:"+txtAddress);
		
		Geocoder geocoder  = new Geocoder();
		
		GeocoderRequest grq = new GeocoderRequestBuilder().setAddress(txtAddress).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse grs = geocoder.geocode(grq);
		
		Float[] coords = new Float[2];
		Float[] value = new Float[2];
		if(grs.getStatus() == GeocoderStatus.OK & !grs.getResults().isEmpty()) {
			GeocoderResult gr = grs.getResults().iterator().next();
	        LatLng loc = gr.getGeometry().getLocation(); 

	        coords[0] = loc.getLat().floatValue();
	        coords[1] = loc.getLng().floatValue();
	      
	        System.out.println("coords[0]:"+ coords[0]);
	        System.out.println("coords[1]:"+ coords[1]);
		}
		return null;
	}
	
	
	
}
