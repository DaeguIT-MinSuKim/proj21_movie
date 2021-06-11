package proj21_movie.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_movie.dto.Notice;

@Service
public interface NoticeService {
	
	List<Notice> showNoticeList();
	List<Notice> showNoticeListByPage(int selectPage);
	Notice showNoticeDetail(int notNo);
	int getTotalNotice();
	
	
	List<Notice> showNoticeByTitle(String notTitle); // 제목 검색. 아직 구현안함.

	int removeNotice(int notNo);
	int modifyNotice(Notice notice);
	int regidateNotice(Notice notice);
	
}
