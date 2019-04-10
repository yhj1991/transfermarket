package com.tm.function;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SupportComment {
	
	private static List<Map<String, Object>> commentList = new ArrayList<Map<String,Object>>();
	
	public static List<Map<String, Object>> getCommentList() {
		return commentList;
	}

	public static void setCommentList(List<Map<String, Object>> commentList) {
		SupportComment.commentList = commentList;
	}

	public static void supportCommentList(int comment_no, List<Map<String, Object>> list, int idx) {
		commentList.add(list.get(idx-1));
		for(int i = idx; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			int p_no = (Integer)map.get("parent_no");
			int c_no = (Integer)map.get("comment_no");
			if(p_no == comment_no) {
				SupportComment.supportCommentList(c_no, list, i+1);
			}
		}
	}
}
