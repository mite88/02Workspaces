<%--
/**
 * 1. 프로젝트명 : breadcrumbs.jsp
 * 2. 작성일 : 2022. 6. 14. 오후 4:31:38
 * 3. 작성자 : mite88
 * 4. 설명 : 상단설명
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 14.    mite88   
 */
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

/*--------------------------------------------------------------
# Breadcrumbs
--------------------------------------------------------------*/
.breadcrumbs .page-header {
  padding: 140px 0 80px 0;
  position: relative;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.breadcrumbs .page-header:before {
  content: "";
  background-color: rgba(14, 29, 52, 0.8);
  position: absolute;
  inset: 0;
}

.breadcrumbs .page-header h2 {
  font-size: 56px;
  font-weight: 500;
  color: #fff;
  font-family: var(--font-secondary);
}

.breadcrumbs .page-header p {
  color: rgba(255, 255, 255, 0.8);
}

.breadcrumbs nav {
  background-color: #f3f6fc;
  padding: 20px 0;
}

.breadcrumbs nav ol {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  margin: 0;
  padding: 0;
  font-size: 16px;
  font-weight: 600;
  color: var(--color-secondary);
}

.breadcrumbs nav ol a {
  color: var(--color-primary);
  transition: 0.3s;
}

.breadcrumbs nav ol a:hover {
  text-decoration: underline;
}

.breadcrumbs nav ol li+li {
  padding-left: 10px;
}

.breadcrumbs nav ol li+li::before {
  display: inline-block;
  padding-right: 10px;
  color: #4278cc;
  content: "/";
}


@media (min-width: 1280px) {

  .mobile-nav-show,
  .mobile-nav-hide {
    display: none;
  }
}

 .mobile-nav-show {
    color: #fff;
    font-size: 28px;
    cursor: pointer;
    line-height: 0;
    transition: 0.5s;
    z-index: 9999;
    margin-right: 10px;
  }

  .mobile-nav-hide {
    color: #fff;
    font-size: 32px;
    cursor: pointer;
    line-height: 0;
    transition: 0.5s;
    position: fixed;
    right: 20px;
    top: 20px;
    z-index: 9999;
  }
</style>
<div class="breadcrumbs">
	<div class="page-header d-flex align-items-center"
		style="background-image: url('assets/img/page-header.jpg');">
		<div class="container position-relative">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-6 text-center">
					<h2>Contact</h2>
					<p>Odio et unde deleniti. Deserunt numquam exercitationem.
						Officiis quo odio sint voluptas consequatur ut a odio voluptatem.
						Sit dolorum debitis veritatis natus dolores. Quasi ratione sint.
						Sit quaerat ipsum dolorem.</p>
				</div>
			</div>
		</div>
	</div>
	<nav>
		<div class="container">
			<ol>
				<li><a href="index.html">Home</a></li>
				<li>Contact</li>
			</ol>
		</div>
	</nav>
</div>