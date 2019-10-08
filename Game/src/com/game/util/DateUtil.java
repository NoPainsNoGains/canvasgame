package com.game.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * 时间工具类
 * @author pym
 *
 */
public class DateUtil {

	@SuppressWarnings("deprecation")
	public static int getDutyDays(String strStartDate, String strEndDate) {//计算两个日期之间的工作日

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");

		Date startDate = null;

		Date endDate = null;

		try {

			startDate = df.parse(strStartDate);

			endDate = df.parse(strEndDate);

		} catch (ParseException e) {

			System.out.println("非法的日期格式,无法进行转换");

			e.printStackTrace();

		}

		int result = 0;

		while (startDate.compareTo(endDate) <= 0) {

			if (startDate.getDay() != 6 && startDate.getDay() != 0)

				result++;

			startDate.setDate(startDate.getDate() + 1);

		}

		return result;

	}

	public static String getNow()// 获取当前系统时间
	{
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		return sdf.format(c.getTime());
	}
	public static Date StrToDate(String str) {
		
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");//yyyy-MM-dd HH:mm:ss
		Date date = null;
		try {
		date = format.parse(str);
		} catch (ParseException e) {
		e.printStackTrace();
		}
		return date;
		}
	public static void main(String args[]){
		DateUtil date=new DateUtil();
		System.out.println(DateUtil.StrToDate("2013-11-19"));
	}
}
