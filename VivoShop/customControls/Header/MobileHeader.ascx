<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MobileHeader.ascx.cs" Inherits="VivoShop.customControls.MobileHeader" %>
<header class="site__header d-lg-none">
    <!-- data-sticky-mode - one of [pullToShow, alwaysOnTop] -->
    <div class="mobile-header mobile-header--sticky" data-sticky-mode="pullToShow">
        <div class="mobile-header__panel">
            <div class="container">
                <div class="mobile-header__body">
                    <button class="mobile-header__menu-button">
                        <svg width="18px" height="14px">
                            <use xlink:href="/images/sprite.svg#menu-18x14"></use>
                        </svg>
                    </button>
                    <a class="mobile-header__logo" href="/">
                        <asp:Image runat="server" ImageUrl="~/images/logo-invert-sm-2.png" />
                    </a>
                    <div class="search search--location--mobile-header mobile-header__search">
                        <div class="search__body">
                            <div class="search__form" action="" role="form">
                                <input class="search__input" name="search" placeholder="Pretraga (preko 4000 proizvoda)" aria-label="Site search" type="text" autocomplete="off">
                                <button class="search__button search__button--type--submit" type="submit">
                                    <svg width="20px" height="20px">
                                        <use xlink:href="/images/sprite.svg#search-20"></use>
                                    </svg>
                                </button>
                                <button class="search__button search__button--type--close" type="button">
                                    <svg width="20px" height="20px">
                                        <use xlink:href="/images/sprite.svg#cross-20"></use>
                                    </svg>
                                </button>
                                <div class="search__border"></div>
                            </div>
                            <div class="search__suggestions suggestions suggestions--location--mobile-header">
                                <ul class="suggestions__list header__search__list"></ul>
                                <span class="d-inline-block p-2 mb-2 mt-2 text-center bg-warning w-100 font-weight-bold">PREPORUČENI PROIZVODI</span>
                                <ul class="suggestions__list header__search__product__list"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-header__indicators">
                        <div class="indicator indicator--mobile-search indicator--mobile d-md-none">
                            <button class="indicator__button" onclick="return false">
                                <span class="indicator__area">
                                    <svg width="20px" height="20px">
                                        <use xlink:href="/images/sprite.svg#search-20"></use>
                                    </svg>
                                </span>
                            </button>
                        </div>
                        <div class="indicator indicator--mobile d-sm-flex d-none">
                            <a href="/lista-zelja" class="indicator__button">
                                <span class="indicator__area">
                                    <svg width="20px" height="20px">
                                        <use xlink:href="/images/sprite.svg#heart-20"></use>
                                    </svg>
                                    <span class="indicator__value">0</span>
                                </span>
                            </a>
                        </div>
                        <div class="indicator indicator--mobile">
                            <a href="/korpa" class="indicator__button">
                                <span class="indicator__area">
                                    <svg width="20px" height="20px">
                                        <use xlink:href="/images/sprite.svg#cart-20"></use>
                                    </svg>
                                    <span id="cartFpProductsCountMobile" class="indicator__value">0</span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>