f.puts "package com.www.web;"

f.puts "import java.util.Date;"
f.puts "import java.util.List;"

f.puts "import javax.annotation.Resource;"
f.puts "import javax.servlet.http.HttpServletRequest;"
f.puts "import javax.servlet.http.HttpServletResponse;"

f.puts "import org.apache.struts.action.ActionForm;"
f.puts "import org.apache.struts.action.ActionForward;"
f.puts "import org.apache.struts.action.ActionMapping;"
f.puts "import org.apache.struts.actions.DispatchAction;"

f.puts "import com.www.entity.Note;"
f.puts "import com.www.service.NoteManager;"

f.puts "public class NoteAction extends DispatchAction {"

f.puts "	@Resource"
f.puts "	private NoteManager notemanager;"


f.puts "	public ActionForward newNote(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts '		return new ActionForward("/note/newNote.jsp");'
f.puts "	}"

f.puts "	public ActionForward createNote(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts '		String title = request.getParameter("title");'
f.puts '		String content = request.getParameter("content");'

f.puts "		Note note = new Note();"
f.puts "		note.setTitle(title);"
f.puts "		note.setContent(content);"
f.puts "		note.setCreated_at(new Date());"
f.puts "		note.setUpdated_at(new Date());"

f.puts "		notemanager.saveOrUpdate(note);"

f.puts "		List<Note> notes = notemanager.findAll();"
f.puts '		request.setAttribute("notes", notes);'

f.puts '		return new ActionForward("/note/listNotes.jsp");'
f.puts "	}"

f.puts "	public ActionForward editNote(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts '		String id = request.getParameter("id");'
f.puts "		Note note = notemanager.find(Integer.parseInt(id));"
f.puts '		request.setAttribute("note", note);'
f.puts '		return new ActionForward("/note/editNote.jsp");'
f.puts "	}"

f.puts "	public ActionForward updateNote(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts '		String id = request.getParameter("id");'
f.puts '		String title = request.getParameter("title");'
f.puts '		String content = request.getParameter("content");'

f.puts "		Note note = notemanager.find(Integer.parseInt(id));"
f.puts "		note.setTitle(title);"
f.puts "		note.setContent(content);"
f.puts "		note.setUpdated_at(new Date());"

f.puts "		notemanager.saveOrUpdate(note);"

f.puts "		List<Note> notes = notemanager.findAll();"
f.puts '		request.setAttribute("notes", notes);'

f.puts '		return new ActionForward("/note/listNotes.jsp");'
f.puts "	}

f.puts "	public ActionForward showNote(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts '		String id = request.getParameter("id");'
f.puts "		Note note = notemanager.find(Integer.parseInt(id));"

f.puts '		request.setAttribute("note", note);'
f.puts '		return new ActionForward("/note/showNote.jsp");'
f.puts "	}

f.puts "	public ActionForward listNotes(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts "		List<Note> notes = notemanager.findAll();"
f.puts '		request.setAttribute("notes", notes);'
f.puts '		return new ActionForward("/note/listNotes.jsp");'
f.puts "	}

f.puts "	public ActionForward deleteNote(ActionMapping mapping, ActionForm form,"
f.puts "			HttpServletRequest request, HttpServletResponse response)"
f.puts "			throws Exception {"

f.puts '		String id = request.getParameter("id");'

f.puts "		notemanager.remove(Integer.parseInt(id));"

f.puts "		List<Note> notes = notemanager.findAll();"
f.puts '		request.setAttribute("notes", notes);'
f.puts '		return new ActionForward("/note/listNotes.jsp");'
f.puts "	}"

f.puts "}"
