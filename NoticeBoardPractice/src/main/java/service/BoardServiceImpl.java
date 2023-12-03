package service;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDAO;
import dto.Board;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	@Override
	public void createBoard(Board board) {
		// TODO Auto-generated method stub
		String title = board.getTitle();
		String content = board.getContent();
		String writer = board.getWriter();

		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace(">", "&gt;");

		title = title.replace(" ", "&nbsp;&nbsp;");
		writer = writer.replace(" ", "&nbsp;&nbsp;");

		content = content.replace("\n", "<br>");

		board.setTitle(title);
		board.setContent(content);
		board.setWriter(writer);

		boardDAO.createBoard(board);

	}

	@Override
	public Board readBoard(int bno) {
		// TODO Auto-generated method stub
		return boardDAO.readBoard(bno);
	}

	@Override
	public void updateBoard(Board board) {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(board);

	}

	@Override
	public void deleteBoard(int bno) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(bno);

	}

	@Override
	public List<Board> listAll() {
		// TODO Auto-generated method stub
		return boardDAO.selectAllBoard();
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		// TODO Auto-generated method stub
		long update_time = 0;

		if (session.getAttribute("update_time : " + bno) != null) {
			update_time = (long) session.getAttribute("update_time : " + bno);
		}

		long current_time = System.currentTimeMillis();

		if (current_time - update_time > 5 * 1000) {
			boardDAO.increaseViewcnt(bno);
			session.setAttribute("update_time : " + bno, current_time);
		}

	}

}
