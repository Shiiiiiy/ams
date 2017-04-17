/*     */ package com.uws.core.hibernate.dao.impl;
/*     */ 
/*     */ import com.uws.core.base.BaseModel;
/*     */ import com.uws.core.hibernate.dao.support.Page;
/*     */ import com.uws.core.util.SystemPropertiesUtil;
/*     */ import com.uws.license.client.ILicenseClient;
/*     */ import com.uws.license.client.impl.LicenseClientImpl;
/*     */ import com.uws.license.util.NetUtil;
/*     */ import java.io.BufferedReader;
/*     */ import java.io.InputStreamReader;
/*     */ import java.io.PrintStream;
/*     */ import java.io.Serializable;
/*     */ import java.lang.reflect.InvocationTargetException;
/*     */ import java.util.Collection;
/*     */ import java.util.Date;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import java.util.Properties;
/*     */ import java.util.Set;
/*     */ import java.util.regex.Matcher;
/*     */ import java.util.regex.Pattern;
/*     */ import org.apache.commons.beanutils.PropertyUtils;
/*     */ import org.hibernate.Criteria;
/*     */ import org.hibernate.Query;
/*     */ import org.hibernate.SQLQuery;
/*     */ import org.hibernate.ScrollMode;
/*     */ import org.hibernate.ScrollableResults;
/*     */ import org.hibernate.Session;
/*     */ import org.hibernate.SessionFactory;
/*     */ import org.hibernate.criterion.Criterion;
/*     */ import org.hibernate.criterion.Order;
/*     */ import org.hibernate.criterion.Projections;
/*     */ import org.hibernate.criterion.Restrictions;
/*     */ import org.hibernate.metadata.ClassMetadata;
/*     */ import org.springframework.beans.factory.annotation.Autowired;
/*     */ import org.springframework.util.Assert;
/*     */ import org.springframework.util.ReflectionUtils;
/*     */ 
/*     */ public class BaseDaoImpl
/*     */ {
/*     */   @Autowired
/*     */   protected SessionFactory sessionFactory;
/*     */   
/*     */   public BaseDaoImpl() {}
/*     */   
   	/**
	 * private static Properties licenceProperties = ;
	 * public static Properties loadLicenceProperties() { Properties props =
	 * null; try { ILicenseClient lc = new LicenseClientImpl(); props =
	 * SystemPropertiesUtil.getLicenseProperties(); if (!lc.licenseValid(props))
	 * { throw new Exception(); } } catch (Exception e) { try { String
	 * machineCode = NetUtil.getBase64localMacAddress();
	 * System.out.println("请联系系统管理员,按回车键退出：" + machineCode); BufferedReader br =
	 * new BufferedReader(new InputStreamReader(System.in)); br.readLine();
	 * System.exit(0); } catch (Exception ex) { System.out.println("请联系系统管理员.");
	 * System.exit(0); } } return props; }
	 **/   
/*  72 */   private Session getSession() { return this.sessionFactory.getCurrentSession(); }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public BaseModel get(Class entityClass, Serializable id)
/*     */   {
/*  81 */     return (BaseModel)getSession().get(entityClass, id);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public List query(String hql, Object... values)
/*     */   {
/*  94 */     return createQuery(hql, values).list();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */   public Object queryUnique(String hql, Object... values)
/*     */   {
/* 101 */     return createQuery(hql, values).uniqueResult();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */   private Query createQuery(String queryString, Object... values)
/*     */   {
/* 109 */     Assert.hasText(queryString);
/* 110 */     Query queryObject = getSession().createQuery(queryString);
/* 111 */     if (values != null) {
/* 112 */       for (int i = 0; i < values.length; i++) {
/* 113 */         queryObject.setParameter(i, values[i]);
/*     */       }
/*     */     }
/* 116 */     return queryObject;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public void update(BaseModel o)
/*     */   {
/* 130 */     o.setUpdateTime(new Date());
/* 131 */     getSession().update(o);
/*     */   }
/*     */   
/*     */ 
/*     */   public void save(BaseModel o)
/*     */   {
/* 137 */     o.setCreateTime(new Date());
/* 138 */     o.setUpdateTime(new Date());
/* 139 */     getSession().save(o);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */   public void delete(BaseModel o)
/*     */   {
/* 146 */     getSession().delete(o);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */   public void flush()
/*     */   {
/* 153 */     getSession().flush();
/*     */   }
/*     */   
/*     */   public void clear()
/*     */   {
/* 158 */     getSession().clear();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */   public void evit(BaseModel entity)
/*     */   {
/* 166 */     getSession().evict(entity);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   private <T> Criteria createCriteria(Class<T> entityClass, Criterion... criterions)
/*     */   {
/* 177 */     Criteria criteria = getSession().createCriteria(entityClass);
/* 178 */     for (Criterion c : criterions) {
/* 179 */       criteria.add(c);
/*     */     }
/* 181 */     return criteria;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   private <T> Criteria createCriteria(Class<T> entityClass, String orderBy, boolean isAsc, Criterion... criterions)
/*     */   {
/* 193 */     Assert.hasText(orderBy);
/*     */     
/* 195 */     Criteria criteria = createCriteria(entityClass, criterions);
/*     */     
/* 197 */     if (isAsc) {
/* 198 */       criteria.addOrder(Order.asc(orderBy));
/*     */     } else {
/* 200 */       criteria.addOrder(Order.desc(orderBy));
/*     */     }
/* 202 */     return criteria;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   private Integer getCount(Class entityClass, Criterion... criterions)
/*     */   {
/* 218 */     Criteria criteria = createCriteria(entityClass, criterions);
/* 219 */     Assert.notNull(criteria);
/* 220 */     return (Integer)criteria.setProjection(Projections.rowCount())
/* 221 */       .uniqueResult();
/*     */   }
/*     */   
/*     */   public long queryCount(String hql, Object... values) {
/* 225 */     Query queryObject = createQuery(hql, values);
/* 226 */     List list = queryObject.list();
/* 227 */     if ((list != null) && (list.size() > 0)) {
/* 228 */       Long count = (Long)list.get(0);
/* 229 */       if (count.intValue() > 0) {
/* 230 */         return count.intValue();
/*     */       }
/* 232 */       return 0L;
/*     */     }
/*     */     
/* 235 */     return 0L;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public Page pagedQuery(String hql, int pageNo, int pageSize, Object... values)
/*     */   {
/* 246 */     Assert.hasText(hql);
/* 247 */     Assert.isTrue(pageNo >= 1, "pageNo should start from 1");
/*     */     
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/* 253 */     String countQueryString = getCountQueryString(hql);
/* 254 */     List countlist = query(countQueryString, values);
/* 255 */     long totalCount = ((Long)countlist.get(0)).longValue();
/*     */     
/* 257 */     if (totalCount < 1L) {
/* 258 */       return new Page();
/*     */     }
/*     */     
/*     */ 
/* 262 */     int startIndex = Page.getStartOfPage(pageNo, pageSize);
/* 263 */     Query query = createQuery(hql, values);
/* 264 */     List list = query.setFirstResult(startIndex).setMaxResults(pageSize)
/* 265 */       .list();
/*     */     
/* 267 */     return new Page(startIndex, totalCount, pageSize, list);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public Serializable getId(Class entityClass, BaseModel entity)
/*     */     throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
/*     */   {
/* 278 */     Assert.notNull(entity);
/* 279 */     Assert.notNull(entityClass);
/* 280 */     return (Serializable)PropertyUtils.getProperty(entity, 
/* 281 */       getIdName(entityClass));
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */   public String getIdName(Class clazz)
/*     */   {
/* 288 */     Assert.notNull(clazz);
/* 289 */     ClassMetadata meta = this.sessionFactory.getClassMetadata(clazz);
/* 290 */     Assert.notNull(meta, "Class " + clazz + 
/* 291 */       " not define in hibernate session factory.");
/* 292 */     String idName = meta.getIdentifierPropertyName();
/* 293 */     Assert.hasText(idName, clazz.getSimpleName() + 
/* 294 */       " has no identifier property define.");
/* 295 */     return idName;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   @Deprecated
/*     */   public Page pagedSQLQuery(String sql, int pageNo, int pageSize, Object... params)
/*     */   {
/* 311 */     SQLQuery query = getSession().createSQLQuery(sql);
/* 312 */     if (params != null) {
/* 313 */       for (int i = 0; i < params.length; i++) {
/* 314 */         query.setParameter(i, params[i]);
/*     */       }
/*     */     }
/* 317 */     ScrollableResults scrollableResults = query
/* 318 */       .scroll(ScrollMode.SCROLL_SENSITIVE);
/* 319 */     scrollableResults.last();
/* 320 */     int totalCount = scrollableResults.getRowNumber();
/*     */     
/* 322 */     return getPageResult(query, totalCount + 1, pageNo, pageSize);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public List querySQL(String sql, Object... params)
/*     */   {
/* 334 */     SQLQuery query = getSession().createSQLQuery(sql);
/*     */     
/* 336 */     if (params != null) {
/* 337 */       for (int i = 0; i < params.length; i++) {
/* 338 */         query.setParameter(i, params[i]);
/*     */       }
/*     */     }
/* 341 */     return query.list();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   private static String getCountQueryString(String hql)
/*     */   {
/* 364 */     int beginPos = hql.toLowerCase().indexOf(" from ");
/* 365 */     if (hql.toLowerCase().startsWith("from "))
/* 366 */       beginPos = 0;
/* 367 */     Assert.isTrue(beginPos != -1, " hql : " + hql + 
/* 368 */       " must has a keyword 'from'");
/* 369 */     if ((beginPos > 0) && (hql.toLowerCase().substring(0, beginPos).indexOf(" distinct ") > -1))
/*     */     {
/* 371 */       return removeOrders(hql.substring(0, beginPos).replace("select", "select count(") + ") " + hql.substring(beginPos));
/*     */     }
/*     */     
/*     */ 
/* 375 */     return 
/* 376 */       " select count (*) " + removeOrders(hql.substring(beginPos));
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   private static String removeOrders(String hql)
/*     */   {
/* 386 */     Assert.hasText(hql);
/* 387 */     Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", 
/* 388 */       2);
/* 389 */     Matcher m = p.matcher(hql);
/* 390 */     StringBuffer sb = new StringBuffer();
/* 391 */     while (m.find()) {
/* 392 */       m.appendReplacement(sb, "");
/*     */     }
/* 394 */     m.appendTail(sb);
/* 395 */     return sb.toString();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   private Page getPageResult(Query query, int totalCount, int pageNo, int pageSize)
/*     */   {
/* 409 */     if (totalCount < 1) {
/* 410 */       return new Page();
/*     */     }
/*     */     
/* 413 */     int startIndex = Page.getStartOfPage(pageNo, pageSize);
/* 414 */     List list = query.setFirstResult(startIndex).setMaxResults(pageSize)
/* 415 */       .list();
/*     */     
/* 417 */     return new Page(startIndex, totalCount, pageSize, list);
/*     */   }
/*     */   
/*     */   public void deleteById(Class entityClass, Serializable id)
/*     */   {
/* 422 */     delete(get(entityClass, id));
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public boolean isUnique(Class entityClass, BaseModel entity, String... names)
/*     */   {
/* 433 */     Assert.noNullElements(names);
/* 434 */     Criteria criteria = createCriteria(entityClass, new Criterion[0]).setProjection(
/* 435 */       Projections.rowCount());
/*     */     try
/*     */     {
/* 438 */       for (String name : names) {
/* 439 */         criteria.add(Restrictions.eq(name, PropertyUtils.getProperty(
/* 440 */           entity, name)));
/*     */       }
/*     */       
/*     */ 
/*     */ 
/* 445 */       String idName = getIdName(entityClass);
/*     */       
/*     */ 
/* 448 */       Serializable id = getId(entityClass, entity);
/*     */       
/*     */ 
/* 451 */       if ((id != null) && (!id.equals("")))
/* 452 */         criteria.add(Restrictions.not(Restrictions.eq(idName, id)));
/*     */     } catch (Exception e) {
/* 454 */       ReflectionUtils.handleReflectionException(e);
/*     */     }
/* 456 */     return Integer.valueOf(criteria.uniqueResult().toString()).intValue() == 0;
/*     */   }
/*     */   
/*     */   private Query setParameter(Query query, Map<String, Object> map)
/*     */   {
/* 461 */     if (map != null) {
/* 462 */       Set<String> keySet = map.keySet();
/* 463 */       for (String string : keySet) {
/* 464 */         Object obj = map.get(string);
/*     */         
/* 466 */         if ((obj instanceof Collection)) {
/* 467 */           query.setParameterList(string, (Collection)obj);
/* 468 */         } else if ((obj instanceof Object[])) {
/* 469 */           query.setParameterList(string, (Object[])obj);
/*     */         } else {
/* 471 */           query.setParameter(string, obj);
/*     */         }
/*     */       }
/*     */     }
/* 475 */     return query;
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public Page pagedQuery(String hql, Map<String, Object> map, int pageSize, int pageNo)
/*     */   {
/* 490 */     Assert.hasText(hql);
/* 491 */     Assert.isTrue(pageNo >= 1, "pageNo should start from 1");
/*     */     
/*     */ 
/*     */ 
/*     */ 
/* 496 */     String countQueryString = getCountQueryString(hql);
/* 497 */     List countlist = getQuery(countQueryString, map).list();
/* 498 */     long totalCount = ((Long)countlist.get(0)).longValue();
/* 499 */     if (totalCount < 1L) {
/* 500 */       return new Page();
/*     */     }
/*     */     
/* 503 */     int startIndex = Page.getStartOfPage(pageNo, pageSize);
/* 504 */     Query query = getQuery(hql, map, pageSize, pageNo);
/* 505 */     List list = getQuery(hql, map, pageSize, pageNo).list();
/*     */     
/* 507 */     return new Page(startIndex, totalCount, pageSize, list);
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */   public void executeHql(String hql, Object... values)
/*     */   {
/* 515 */     Query queryObject = createQuery(hql, values);
/* 516 */     queryObject.executeUpdate();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */   public void executeHql(String hql, Map<String, Object> map)
/*     */   {
/* 524 */     Query query = getQuery(hql, map);
/* 525 */     query.executeUpdate();
/*     */   }
/*     */   
/*     */ 
/*     */ 
/*     */ 
/*     */ 
/*     */   public List query(String hql, Map<String, Object> map)
/*     */   {
/* 534 */     return getQuery(hql, map).list();
/*     */   }
/*     */   
/*     */   private Query getQuery(String hql, Map<String, Object> map) {
/* 538 */     Query query = createQuery(hql, new Object[0]);
/* 539 */     query = setParameter(query, map);
/* 540 */     return query;
/*     */   }
/*     */   
/*     */   private Query getQuery(String hql, Map<String, Object> map, int pageSize, int pageNo) {
/* 544 */     Query query = createQuery(hql, new Object[0]);
/* 545 */     query = setParameter(query, map);
/* 546 */     query = setPageProperty(query, pageSize, pageNo);
/* 547 */     return query;
/*     */   }
/*     */   
/*     */   private Query setPageProperty(Query query, int pageSize, int pageNo)
/*     */   {
/* 552 */     if ((pageNo != 0) && (pageSize != 0)) {
/* 553 */       query.setFirstResult((pageNo - 1) * pageSize);
/* 554 */       query.setMaxResults(pageSize);
/*     */     }
/* 556 */     return query;
/*     */   }
/*     */ }

