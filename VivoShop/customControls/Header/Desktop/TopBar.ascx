<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBar.ascx.cs" Inherits="VivoShop.customControls.Header.TopBar" %>
<!-- .topbar -->
        <div class="site-header__topbar topbar">
            <div class="topbar__container container">
                <div class="topbar__row">
                    <div class="topbar__item topbar__item--link">
                        <a class="topbar-link" href="/o-nama">O nama</a>
                    </div>
                    <div class="topbar__item topbar__item--link">
                        <a class="topbar-link" href="/kontakt">Kontakt</a>
                    </div>
                    <div class="topbar__item topbar__item--link">
                        <a class="topbar-link" href="/gde-se-nalazimo">Gde se nalazimo</a>
                    </div>
                    <div class="topbar__item topbar__item--link">
                        <a class="topbar-link" href="track-order.html">Praćenje porudžbine</a>
                    </div>
                    <div class="topbar__item topbar__item--link">
                        <a class="topbar-link" href="/blog">Blog</a>
                    </div>
                    <div class="topbar__spring"></div>
                    <div class="topbar__item">
                        <div class="topbar-dropdown">
                            <button class="topbar-dropdown__btn" type="button">
                                Moj nalog
                                        <svg width="7px" height="5px">
                                            <use xlink:href="/images/sprite.svg#arrow-rounded-down-7x5"></use>
                                        </svg>
                            </button>
                            <div class="topbar-dropdown__body">
                                <!-- .menu -->
                                <div class="menu menu--layout--topbar ">
                                    <div class="menu__submenus-container"></div>
                                    <ul class="menu__list">
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="account-dashboard.html">Kontrolna tabla
                                            </a>
                                        </li>
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="account-profile.html">Izmena profila
                                            </a>
                                        </li>
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="account-orders.html">Istorija poručivanja
                                            </a>
                                        </li>
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="account-addresses.html">Adrese
                                            </a>
                                        </li>
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="account-password.html">Izmena šifre
                                            </a>
                                        </li>
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="account-login.html">Izloguj se
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- .menu / end -->
                            </div>
                        </div>
                    </div>
                    <div class="topbar__item">
                        <div class="topbar-dropdown">
                            <button class="topbar-dropdown__btn" type="button">
                                Valuta: <span class="topbar__item-value">DIN</span>
                                <svg width="7px" height="5px">
                                    <use xlink:href="/images/sprite.svg#arrow-rounded-down-7x5"></use>
                                </svg>
                            </button>
                            <div class="topbar-dropdown__body">
                                <!-- .menu -->
                                <div class="menu menu--layout--topbar ">
                                    <div class="menu__submenus-container"></div>
                                    <ul class="menu__list">
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link">RSD Dinar
                                            </a>
                                        </li>
                                        <%--<li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="">€ Euro
                                            </a>
                                        </li>
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        £ Pound Sterling
                                                    </a>
                                                </li>-->
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        $ US Dollar
                                                    </a>
                                                </li>-->
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        ₽ Russian Ruble
                                                    </a>
                                                </li>-->--%>
                                    </ul>
                                </div>
                                <!-- .menu / end -->
                            </div>
                        </div>
                    </div>
                    <div class="topbar__item">
                        <div class="topbar-dropdown">
                            <button class="topbar-dropdown__btn" type="button">
                                Srpski: <span class="topbar__item-value">SR</span>
                                <svg width="7px" height="5px">
                                    <use xlink:href="/images/sprite.svg#arrow-rounded-down-7x5"></use>
                                </svg>
                            </button>
                            <div class="topbar-dropdown__body">
                                <!-- .menu -->
                                <div class="menu menu--layout--topbar  menu--with-icons ">
                                    <div class="menu__submenus-container"></div>
                                    <ul class="menu__list">
                                        <li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="">
                                                <div class="menu__item-icon">
                                                    <img srcset="/images/languages/language-1.png 1x, /images/languages/language-1@2x.png 2x" src="/images/languages/language-1.png" alt=""></div>
                                                Srpski
                                            </a>
                                        </li>
                                        <%--<li class="menu__item">
                                            <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                            <div class="menu__item-submenu-offset"></div>
                                            <a class="menu__item-link" href="">
                                                <div class="menu__item-icon">
                                                    <img srcset="/images/languages/language-1.png 1x, /images/languages/language-1@2x.png 2x" src="/images/languages/language-1.png" alt=""></div>
                                                English
                                            </a>
                                        </li>--%>
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        <div class="menu__item-icon"><img srcset="/images/languages/language-2.png 1x, images/languages/language-2@2x.png 2x" src="/images/languages/language-2.png" alt=""></div>
                                                        French
                                                    </a>
                                                </li>-->
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        <div class="menu__item-icon"><img srcset="/images/languages/language-3.png 1x, images/languages/language-3@2x.png 2x" src="/images/languages/language-3.png" alt=""></div>
                                                        German
                                                    </a>
                                                </li>-->
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        <div class="menu__item-icon"><img srcset="/images/languages/language-4.png 1x, images/languages/language-4@2x.png 2x" src="/images/languages/language-4.png" alt=""></div>
                                                        Russian
                                                    </a>
                                                </li>-->
                                        <!--<li class="menu__item">-->
                                        <!-- This is a synthetic element that allows to adjust the vertical offset of the submenu using CSS. -->
                                        <!--<div class="menu__item-submenu-offset"></div>
                                                    <a class="menu__item-link" href="">
                                                        <div class="menu__item-icon"><img srcset="/images/languages/language-5.png 1x, images/languages/language-5@2x.png 2x" src="/images/languages/language-5.png" alt=""></div>
                                                        Italian
                                                    </a>
                                                </li>-->
                                    </ul>
                                </div>
                                <!-- .menu / end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- .topbar / end -->