package com.khayrullin.manager.controllers;

import com.khayrullin.manager.domain.Note;
import com.khayrullin.manager.domain.User;
import com.khayrullin.manager.repos.NoteRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
@RequestMapping("/home")
public class MainController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private NoteRepo noteRepo;

    @GetMapping()
    public String home(
            Map<String, Object> model
    ) {
        return "homePage";
    }

    @GetMapping("/notes")
    public String note (@RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {
        Iterable<Note> notes = noteRepo.findAll();

        if (filter != null && !filter.isEmpty()) {
            notes = noteRepo.findByTag(filter);
        } else
            notes = noteRepo.findAll();


        model.addAttribute("notes", notes);
        model.addAttribute("filter", filter);
        return "notes";
    }

    @PostMapping("/notes")
    public String addNote (
            @RequestParam("file") MultipartFile file,
            @AuthenticationPrincipal User user,
            @Valid Note note,
            BindingResult bindingResult,
            Model model
            ) throws IOException {
        note.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorMap);
            model.addAttribute("note", note) ;
        } else {
            saveFile(file, note);

            model.addAttribute("note", null);
            noteRepo.save(note);
        }
            //временно
        Iterable<Note> notes = noteRepo.findAll();
        model.addAttribute("notes", notes);

        return "notes";
    }

    private void saveFile(MultipartFile file, Note note) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            note.setFilename(resultFilename);
        }
    }

    @GetMapping("/user-notes/{user}")
    public String userNotes(
            @AuthenticationPrincipal User currentUser,
            @PathVariable(name = "user") User user,
            Model model,
            @RequestParam(required = false) Note note
    ) {
        Set<Note> notes = user.getNotes();

        model.addAttribute("userChannel", user);
        model.addAttribute("subscriptionsCount", user.getSubscriptions().size());
        model.addAttribute("subscribersCount", user.getSubscribers().size());
        model.addAttribute("isSubscriber", user.getSubscribers().contains(currentUser));
        model.addAttribute("notes", notes);
        model.addAttribute("note", note);
        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "userNotes";
    }

    @PostMapping("/user-notes/{user}")
    public String updateNote(
            @AuthenticationPrincipal User currentUser,
            @PathVariable(name = "user") Long user,
            @RequestParam("id") Note note,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
            ) throws IOException {
        if (note.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text))
                note.setText(text);
            if (!StringUtils.isEmpty(tag))
                note.setTag(tag);
            noteRepo.save(note);
            saveFile(file, note);
        }
        return "redirect:/home/user-notes/" + user;
    }

}
