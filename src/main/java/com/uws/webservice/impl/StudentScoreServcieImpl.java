package com.uws.webservice.impl;

import javax.xml.namespace.QName;

import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.springframework.stereotype.Service;

import com.uws.core.base.BaseServiceImpl;
import com.uws.core.util.MD5;
import com.uws.webservice.IStudentScoreServcie;

/**
 * 
* @ClassName: FeeServiceImpl 
* @Description: 学生成绩接口调用
* @author 联合永道
* @date 2015-9-1 下午2:24:40 
*
 */
@Service("com.uws.webservice.impl.StudentScoreServcieImpl")
public class StudentScoreServcieImpl extends BaseServiceImpl implements IStudentScoreServcie
{

	@Override
	public String[] getStudentAverageScore(String schoolYear, String term,String stuNumber, String time)
	{
		String signKey ="HZKJ201613026";
		//格式schoolYear code ：2015  term code 1   stuNumber:20150326  time : 年月日十分
		String sign = schoolYear+"#"+term+"#"+stuNumber+"#"+signKey+"#"+time;
		String[] result = null;
		try
		{
		    JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		    String wsdlUrl = "http://esb.hzpt.edu.cn/esbpro/proxy/ProxyServiceJwcj?wsdl";
	        org.apache.cxf.endpoint.Client client = dcf.createClient(wsdlUrl);  
	        //url为调用webService的wsdl地址  method
	        QName name=new QName("http://common.webservice.org/", "getStudentAverageScore"); 
	        String signkey = MD5.crypt(sign).toUpperCase();
	        result=(String[]) client.invoke(signkey);
		} catch (Exception e){
			e.printStackTrace();
		}
		return result;
	}

}
