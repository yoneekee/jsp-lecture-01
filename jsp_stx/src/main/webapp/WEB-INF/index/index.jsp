<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
	 <main class="main">
      <section class="main-visual">
        <h2 class="hidden">main visual area</h2>
        <ul class="swiper-wrapper">
          <li class="main-visual--visual01 swiper-slide" style="background-image: url('${pageContext.request.context/업로드 폴더명}');"></li>
          <li class="main-visual--visual02 swiper-slide"></li>
          <li class="main-visual--visual03 swiper-slide"></li>
        </ul>
        <div class="main-visual__txt" data-splitting>
          <p class="main-visual__txt--main">
            BEST OF THE WORLD <br />
            STX Engineering & Construction
          </p>
          <p class="main-visual__txt--sub">세계최고를 향해 STX건설이 힘차게 질주합니다!</p>
        </div>
        <div class="pagination">
          <div class="pagination-box"></div>
          <button class="btn btn--auto"></button>
        </div>
      </section>
      <section class="section business">
        <div class="container">
          <div class="title-box">
            <h2>STX Engineering & Construction Business</h2>
            <p>
              STX건설은 건문 역량 강화를 통해 건축, 주택, 토목, 플랜트 사업 영역에서 <br />
              탁월한 성과를 인정받은 기업으로 자연과 기술의 공간에 인류의 가치를 추구합니다.
            </p>
          </div>
          <ul class="business-list">
            <li>
              <a href="">
                <h3>건축사업</h3>
              </a>
            </li>
            <li>
              <a href="">
                <h3>건축사업</h3>
              </a>
            </li>
            <li>
              <a href="">
                <h3>건축사업</h3>
              </a>
            </li>
            <li>
              <a href="">
                <h3>건축사업</h3>
              </a>
            </li>
            <li>
              <a href="">
                <h3>건축사업</h3>
              </a>
            </li>
          </ul>
        </div>
      </section>
      <section class="section board">
        <div class="container">
          <article class="board-item">
            <h2>공지사항</h2>
            <ul>
              <li>
                <a href=""
                  >사무실 이전 안내는 안하니까 알아서들 찾아오세요.사무실 이전 안내는 안하니까 알아서들 찾아오세요.사무실 이전 안내는 안하니까 알아서들 찾아오세요.사무실 이전 안내는 안하니까 알아서들
                  찾아오세요.사무실 이전 안내는 안하니까 알아서들 찾아오세요.사무실 이전 안내는 안하니까 알아서들 찾아오세요.</a
                >
              </li>
              <li><a href="">에스티엑스건설자산관리 주식회사 해산결의에 따른 채권은 쓰레기</a></li>
              <li><a href="">에스티엑스건설자산관리 주식회사 해산결의에 따른 채권은 쓰레기</a></li>
              <li><a href="">에스티엑스건설자산관리 주식회사 해산결의에 따른 채권은 쓰레기</a></li>
            </ul>
          </article>
          <article class="board-item">
            <h2>보도자료</h2>
            <ul>
              <li><a href="">사무실 이전 안내는 안하니까 알아서들 찾아오세요.</a></li>
              <li><a href="">에스티엑스건설자산관리 주식회사 해산결의에 따른 채권은 쓰레기</a></li>
              <li><a href="">에스티엑스건설자산관리 주식회사 해산결의에 따른 채권은 쓰레기</a></li>
              <li><a href="">에스티엑스건설자산관리 주식회사 해산결의에 따른 채권은 쓰레기</a></li>
            </ul>
          </article>
        </div>
      </section>
      <section class="section util">
        <div class="container">
          <a class="util-item">
            <h2>faq</h2>
            <p>
              STX건설 고객님들을 위해 자주하시는 <br />
              질문과 답변을 정리하였습니다.
            </p>
          </a>
          <a class="util-item">
            <h2>고객문의</h2>
            <p>
              STX건설 고객상담은 고객만족 서비스를 위하여 <br />
              최선을 다하고 있습니다.
            </p>
          </a>
        </div>
      </section>
      <section class="section about">
        <div class="container">
          <div class="title-box">
            <h2>ABOUT US</h2>
            <p>
              <strong>
                고객의 믿음과 신뢰로 성장하는 <br />
                STX건설이 되겠습니다.
              </strong>
            </p>
            <p>
              STX건설 이름으로 세계 어디에서, 세계 누구와 겨뤄도 <br />
              자신 있는 세계 최고를 향해 웅비합니다. STX건설이라는 날개를 <br />
              하나 더 피고 세계로, 미래로 나아가는 STX건설의 힘찬 비상을 <br />
              주목해 주십시오.
            </p>
          </div>
        </div>
        <div>
          <ul class="about-list">
            <li><a href="">경영이념</a></li>
            <li><a href="">공유가치</a></li>
            <li><a href="">중장기전략</a></li>
          </ul>
        </div>
      </section>
    </main>
<%@ include file="../include/footer.jsp"%>


