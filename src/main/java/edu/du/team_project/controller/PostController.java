package edu.du.team_project.controller;

import edu.du.team_project.model.Post;
import edu.du.team_project.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/posts")
public class PostController {
    private final PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    //게시판 목록 페이지
    @GetMapping
    public String listPosts(Model model) {
        model.addAttribute("posts", postService.getAllPosts());
        return "posts";
    }

    // 글 상세보기
    @GetMapping("/{id}")
    public String viewPost(@PathVariable int id, Model model) {
        Post post = postService.getPostById(id);
        model.addAttribute("post", post);
        return "detail";
    }

    // 글 작성 페이지
    @GetMapping("/write")
    public String newPostForm() {
        return "write";
    }

    // 글 작성 처리
    @PostMapping("/add")
    public String addPost(@ModelAttribute Post post) {
        postService.addPost(post);
        return "redirect:/posts";
    }

    // 글 수정 페이지
    @GetMapping("/edit/{id}")
    public String editPostForm(@PathVariable int id, Model model) {
        Post post = postService.getPostById(id);
        model.addAttribute("post", post);
        return "editPost";
    }

    // 글 수정 처리
    @PostMapping("/update")
    public String updatePost(@ModelAttribute Post post) {
        postService.updatePost(post);
        return "redirect:/posts";
    }

    // 글 삭제
    @PostMapping("/delete")
    public String deletePost(@RequestParam int id) {
        postService.deletePost(id);
        return "redirect:/posts";
    }
}