package com.uws.core.hibernate.dao.support;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import com.uws.core.util.DataUtil;
import com.uws.core.util.SystemPropertiesUtil;

/**
 * 
* @ClassName: Page 
* @Description: 分页类重封装
* @author 联合永道
* @date 2015-9-16 下午1:38:22 
*
 */
public class Page implements Serializable
{
	private static final long serialVersionUID = -7050810756121673815L;
	public static int DEFAULT_PAGE_SIZE = 20;

	private int pageSize = DEFAULT_PAGE_SIZE;
	private long start;
	private Collection data;
	private long totalCount;

	static{
		String pageSizePropertiy = SystemPropertiesUtil.getSystemConfigProperties().getProperty("system.pagesize.default");
		if(DataUtil.isNotNull(pageSizePropertiy))
			DEFAULT_PAGE_SIZE = Integer.parseInt(pageSizePropertiy);
	}
	
	public Page()
	{
		this(0L, 0L, DEFAULT_PAGE_SIZE, new ArrayList(0));
	}

	public Page(long start, long totalSize, int pageSize, Collection data)
	{
		if (pageSize == 0)
			this.pageSize = DEFAULT_PAGE_SIZE;
		else
			this.pageSize = pageSize;
		this.start = start;
		this.totalCount = totalSize;
		this.data = data;
	}

	public long getTotalCount()
	{
		return this.totalCount;
	}

	public long getTotalPageCount()
	{
		if (this.totalCount % this.pageSize == 0L)
		{
			return this.totalCount / this.pageSize;
		}
		return this.totalCount / this.pageSize + 1L;
	}

	public int getPageSize()
	{
		return this.pageSize;
	}

	public Collection getResult()
	{
		return this.data;
	}

	public void setResult(Collection data)
	{
		this.data = data;
	}

	public long getCurrentPageNo()
	{
		return this.start / this.pageSize + 1L;
	}

	public boolean hasNextPage()
	{
		return getCurrentPageNo() < getTotalPageCount();
	}

	public boolean hasPreviousPage()
	{
		return getCurrentPageNo() > 1L;
	}

	public long getNextPageNo()
	{
		if (hasNextPage())
		{
			return getCurrentPageNo() + 1L;
		}

		return getCurrentPageNo();
	}

	public long getPreviousPageNo()
	{
		if (hasPreviousPage())
		{
			return getCurrentPageNo() - 1L;
		}

		return getCurrentPageNo();
	}

	public static int getStartOfPage(int pageNo, int pageSize)
	{
		return (pageNo - 1) * pageSize;
	}

	protected static int getStartOfPage(int pageNo)
	{
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	public long getStart()
	{
		return this.start;
	}

	public void setStart(long start)
	{
		this.start = start;
	}

	public void setPageSize(int pageSize)
	{
		this.pageSize = pageSize;
	}

	public void setTotalCount(long totalCount)
	{
		this.totalCount = totalCount;
	}
}