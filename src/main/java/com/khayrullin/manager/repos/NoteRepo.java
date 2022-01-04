package com.khayrullin.manager.repos;

import com.khayrullin.manager.domain.Note;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface NoteRepo extends CrudRepository<Note, Long> {
    List<Note> findByTag(String text);
}
