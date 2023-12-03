package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dto.Board;
import service.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("list.do")
	public ModelAndView list() {
		List<Board> list = boardService.listAll();
		
		ModelAndView modelandView = new ModelAndView();
		modelandView.setViewName("board/list");
		modelandView.addObject("list",list);
		return modelandView;
	}
	
	@RequestMapping(value="write.do",method=RequestMethod.GET)
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value="insert.do",method=RequestMethod.POST)
	public String insert(@ModelAttribute Board board) {
		boardService.createBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="view.do",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) {
		boardService.increaseViewcnt(bno, session);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/view");
		
		mav.addObject("dto",boardService.readBoard(bno));
		return mav;
	}
	
	@RequestMapping(value="update.do",method=RequestMethod.POST)
	public String update(@ModelAttribute Board board) {
		boardService.updateBoard(board);
		return "redirect:list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) {
		boardService.deleteBoard(bno);
		return "redirect:list.do";
	}
}
