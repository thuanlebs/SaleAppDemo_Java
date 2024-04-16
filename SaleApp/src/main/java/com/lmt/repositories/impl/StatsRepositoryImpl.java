///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.lmt.repositories.impl;
//
//
//import com.lmt.pojo.OrderDetail;
//import com.lmt.pojo.Product;
//import com.lmt.pojo.SaleOrder;
//import java.util.ArrayList;
//import java.util.List;
//import javax.persistence.Query;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Predicate;
//import javax.persistence.criteria.Root;
//import org.hibernate.Session;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
///**
// *
// * @author admin
// */
//@Transactional
//@Repository
//public class StatsRepositoryImpl {
//    @Autowired
//    private LocalSessionFactoryBean factory;
//    public List<Object[]> statsRevenueByProduct() {
//        Session s = this.factory.getObject().getCurrentSession();
//            CriteriaBuilder b = s.getCriteriaBuilder();
//            CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
//            
//            Root rP = q.from(Product.class);
//            Root rD = q.from(OrderDetail.class);
//            
//            q.multiselect(rP.get("id"), rP.get("name"), b.sum(b.prod(rD.get("quantity"), rD.get("unitPrice"))));
//            
//            List<Predicate> predicates = new ArrayList<>();
//            predicates.add(b.equal(rD.get("productId"), rP.get("id")));
//            
//            q.where(predicates.toArray(Predicate[]::new ));
//            
//            q.groupBy(rP.get("id"));
//            
//            Query query = s.createQuery(q);
//            return query.getResultList();
//        
//    }
//    
//     public List<Object[]> statsRevenueByPeriod(int year, String period) {
//         Session s = this.factory.getObject().getCurrentSession();
//            CriteriaBuilder b = s.getCriteriaBuilder();
//            CriteriaQuery<Object[]> q = b.createQuery(Object[].class);
//            
//            Root rD = q.from(OrderDetail.class);
//            Root rO = q.from(SaleOrder.class);
//            
//            q.multiselect(b.function(period, Integer.class, rO.get("createdDate")), b.sum(b.prod(rD.get("quantity"), rD.get("unitPrice"))));
//            
//            List<Predicate> predicates = new ArrayList<>();
//            predicates.add(b.equal(rD.get("orderId"), rO.get("id")));
//            predicates.add(b.equal(b.function("YEAR", Integer.class, rO.get("createdDate")), year));
//            
//            q.where(predicates.toArray(Predicate[]::new ));
//            q.groupBy(b.function(period, Integer.class, rO.get("createdDate")));
//            
//            Query query = s.createQuery(q);
//            return query.getResultList();
//        }
//    }