package com.game.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class GenericsUtils
{
	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz, int index)
	{
		
		Type genType = clazz.getGenericSuperclass();
		if (!(genType instanceof ParameterizedType))
		{
			return Object.class;
		}
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0)
		{
			throw new RuntimeException("浣犺緭鍏ョ殑绱㈠紩" + (index < 0 ? "涓嶈兘灏忎簬0" : "瓒呭嚭浜嗗弬鏁扮殑鎬绘暟"));
		}
		if (!(params[index] instanceof Class))
		{
			return Object.class;
		}
		return (Class) params[index];
	}


	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz)
	{
		return getSuperClassGenricType(clazz, 0);
	}


	@SuppressWarnings("unchecked")
	public static Class getMethodGenericReturnType(Method method, int index)
	{
		Type returnType = method.getGenericReturnType();
		if (returnType instanceof ParameterizedType)
		{
			ParameterizedType type = (ParameterizedType) returnType;
			Type[] typeArguments = type.getActualTypeArguments();
			if (index >= typeArguments.length || index < 0)
			{
				throw new RuntimeException("浣犺緭鍏ョ殑绱㈠紩" + (index < 0 ? "涓嶈兘灏忎簬0" : "瓒呭嚭浜嗗弬鏁扮殑鎬绘暟"));
			}
			return (Class) typeArguments[index];
		}
		return Object.class;
	}

	
	@SuppressWarnings("unchecked")
	public static Class getMethodGenericReturnType(Method method)
	{
		return getMethodGenericReturnType(method, 0);
	}

	
	@SuppressWarnings("unchecked")
	public static List<Class> getMethodGenericParameterTypes(Method method, int index)
	{
		List<Class> results = new ArrayList<Class>();
		Type[] genericParameterTypes = method.getGenericParameterTypes();
		if (index >= genericParameterTypes.length || index < 0)
		{
			throw new RuntimeException("浣犺緭鍏ョ殑绱㈠紩" + (index < 0 ? "涓嶈兘灏忎簬0" : "瓒呭嚭浜嗗弬鏁扮殑鎬绘暟"));
		}
		Type genericParameterType = genericParameterTypes[index];
		if (genericParameterType instanceof ParameterizedType)
		{
			ParameterizedType aType = (ParameterizedType) genericParameterType;
			Type[] parameterArgTypes = aType.getActualTypeArguments();
			for (Type parameterArgType : parameterArgTypes)
			{
				Class parameterArgClass = (Class) parameterArgType;
				results.add(parameterArgClass);
			}
			return results;
		}
		return results;
	}

	
	@SuppressWarnings("unchecked")
	public static List<Class> getMethodGenericParameterTypes(Method method)
	{
		return getMethodGenericParameterTypes(method, 0);
	}

	
	@SuppressWarnings("unchecked")
	public static Class getFieldGenericType(Field field, int index)
	{
		Type genericFieldType = field.getGenericType();

		if (genericFieldType instanceof ParameterizedType)
		{
			ParameterizedType aType = (ParameterizedType) genericFieldType;
			Type[] fieldArgTypes = aType.getActualTypeArguments();
			if (index >= fieldArgTypes.length || index < 0)
			{
				throw new RuntimeException("浣犺緭鍏ョ殑绱㈠紩" + (index < 0 ? "涓嶈兘灏忎簬0" : "瓒呭嚭浜嗗弬鏁扮殑鎬绘暟"));
			}
			return (Class) fieldArgTypes[index];
		}
		return Object.class;
	}

	
	@SuppressWarnings("unchecked")
	public static Class getFieldGenericType(Field field)
	{
		return getFieldGenericType(field, 0);
	}

	
	public static List<Field> getFieldsByType(Object object, Class<?> type)
	{
		List<Field> list = new ArrayList<Field>();
		Field[] fields = object.getClass().getDeclaredFields();
		for (Field field : fields)
		{
			if (field.getType().isAssignableFrom(type))
			{
				list.add(field);
			}
		}
		return list;
	}

	
	public static Object getObjectByField(Object object, String fieldName)
	{
		Object result = null;
		try
		{
			Field field = object.getClass().getDeclaredField(fieldName);

			
			boolean accessible = field.isAccessible();

			
			field.setAccessible(true);

		
			result = field.get(object);

			
			field.setAccessible(accessible);
		}
		catch (Exception e)
		{
			throw new RuntimeException(e);
		}
		return result;
	}
}
