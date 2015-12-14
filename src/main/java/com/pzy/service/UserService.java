
package com.pzy.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import com.pzy.entity.Major;
import com.pzy.entity.Result;
import com.pzy.entity.User;
import com.pzy.repository.UserRepository;

@Service
public class UserService {
     @Autowired
     private UserRepository userRepository;
     @Autowired
     private PlanService planService;
     @Autowired
     private ResultService resultService;
     public List<User> findAll() {
          return (List<User>) userRepository.findAll();
     }
     public Page<User> findAll(final int pageNumber, final int pageSize,final String userName){
               PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
              
               Specification<User> spec = new Specification<User>() {
                    @Override
                    public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                    Predicate predicate = cb.conjunction();
                    if (userName != null) {
                         predicate.getExpressions().add(cb.like(root.get("name").as(String.class), userName+"%"));
                    }
                    return predicate;
                    }
               };
               Page<User> result = (Page<User>) userRepository.findAll(spec, pageRequest);
               return result;
     }
     public Page<User> findAll(final int pageNumber, final int pageSize,final String userName,final Major major){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        
         Specification<User> spec = new Specification<User>() {
              @Override
              public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (userName != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), userName+"%"));
              }
              Subquery<Result> subquery = query.subquery(Result.class);
			  Root<Result> resultRoot = subquery.from(Result.class);
			  Predicate predicatesub = cb.conjunction();
			  predicatesub.getExpressions().add(cb.equal(resultRoot.get("user").as(User.class), root));
			  subquery.where(predicatesub).select(resultRoot);
			  predicate.getExpressions().add(cb.not( cb.exists(subquery)));
              return predicate;
              }
         };
         Page<User> result = (Page<User>) userRepository.findAll(spec, pageRequest);
         return result;
     }
     public Page<User> findAllCount(final int pageNumber, final int pageSize,final String userName,final Major major){
         PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
        
         Specification<User> spec = new Specification<User>() {
              @Override
              public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
              Predicate predicate = cb.conjunction();
              if (userName != null) {
                   predicate.getExpressions().add(cb.like(root.get("name").as(String.class), userName+"%"));
              }
              if (major != null) {
                  predicate.getExpressions().add(cb.equal(root.get("major").as(Major.class), major));
              }
              return predicate;
              }
         };
         Page<User> result = (Page<User>) userRepository.findAll(spec, pageRequest);
         for(User user:result.getContent()){
        	 user.setAcout(this.planService.findAll(user.getMajor(), "2015-下学期").size());
        	 user.setBcount(resultService.findAllByUser(user).size());
         }
         return result;
     }
     public void delete(Long id){
          userRepository.delete(id);
     }
     public User find(Long id){
    	  return userRepository.findOne(id);
     }
     public void save(User User){
    	 userRepository.save(User);
     }
     public User login(String adminUserName,String password){
    	 List<User> adminUsers=userRepository.findByUsernameAndPassword(adminUserName,password);
    	 return adminUsers.size()==0?null:adminUsers.get(0);
     }
}