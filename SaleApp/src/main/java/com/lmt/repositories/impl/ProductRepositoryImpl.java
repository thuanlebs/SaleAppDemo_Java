/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.lmt.repositories.impl;

import com.lmt.pojo.Product;
import com.lmt.repositories.ProductRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
public class ProductRepositoryImpl implements ProductRepository{
    @Autowired
    private LocalSessionFactoryBean factory;
    public List<Product> getProducts(Map<String, String> params) {
        Session s=this.factory.getObject().getCurrentSession();
            CriteriaBuilder b = s.getCriteriaBuilder();
            CriteriaQuery<Product> q = b.createQuery(Product.class);
            Root r = q.from(Product.class);
            q.select(r);
            
            List<Predicate> predicates = new ArrayList<>();
            
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty())
                predicates.add(b.like(r.get("name"), String.format("%%%s%%", kw)));
            
            String fromPrice = params.get("fromPrice");
            if (fromPrice != null && !fromPrice.isEmpty())
                predicates.add(b.greaterThanOrEqualTo(r.get("price"), Double.parseDouble(fromPrice)));
            
            String toPrice = params.get("toPrice");
            if (toPrice != null && !toPrice.isEmpty())
                predicates.add(b.lessThanOrEqualTo(r.get("price"), Double.parseDouble(toPrice)));
            
            String cateId = params.get("cateId");
            if (cateId != null && !cateId.isEmpty())
                predicates.add(b.equal(r.get("category").as(Integer.class), Integer.parseInt(cateId)));
            
            q.where(predicates.toArray(Predicate[]::new));
            q.orderBy(b.desc(r.get("id")));
            
            Query query = s.createQuery(q);
            List<Product> products = query.getResultList();
            
            return products;
        
    }
    
    public void addOrUpdate(Product p) {
        Session s = this.factory.getObject().getCurrentSession();
            s.saveOrUpdate(p);
        
    }
}
