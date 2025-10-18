package com.example.medicexpert.filters;

import com.example.medicexpert.entity.Staph;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI();
        Staph user = (Staph) req.getSession().getAttribute("user");

        if(path.contains("/login") || path.contains("staphRegister") ||
                path.contains("/css") || path.contains("/js") || path.contains("/images")){
            chain.doFilter(request,response);
            return;
        }

        if(user == null){
            res.sendRedirect(req.getContextPath()+"/login");
            return;
        }

        String role = user.getRole().name();

        if(path.contains("nurse") && !role.equals("nurse")){
            res.sendRedirect(req.getContextPath()+"/unauthorized.jsp");
        }

        if(path.contains("general") && !role.equals("general_doctor")){
            res.sendRedirect(req.getContextPath()+"/unauthorized.jsp");
        }

        if(path.contains("special") && !role.equals("special_doctor")){
            res.sendRedirect(req.getContextPath()+"/unauthorized.jsp");
        }

        chain.doFilter(request,response);
    }
}
