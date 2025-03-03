<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="VivoShop.product" %>

<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/ProductControls/ProductGallery/ProductGalleryControl.ascx" TagName="ProductGallery" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/ProductControls/PhotoswipeContainer/PhotoswipeContainerControl.ascx" TagName="PhotoswipeContainer" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockProductsCarousel/BlockProductsCarousel.ascx" TagName="BlockProductsCarousel" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" ShowTitle="false" />

        <div class="block">
            <div class="container">
                <div class="product product--layout--standard" data-layout="standard">
                    <div class="product__content">
                        <Vivo:ProductGallery ID="productGallery" runat="server"></Vivo:ProductGallery>
                        <div class="product__info">
                            <div class="product__wishlist-compare">
                                <button type="button" class="btn btn-sm btn-light btn-svg-icon" data-toggle="tooltip" data-placement="right" title="Wishlist">
                                    <svg width="16px" height="16px">
                                        <use xlink:href="/images/sprite.svg#wishlist-16"></use>
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-sm btn-light btn-svg-icon" data-toggle="tooltip" data-placement="right" title="Compare">
                                    <svg width="16px" height="16px">
                                        <use xlink:href="/images/sprite.svg#compare-16"></use>
                                    </svg>
                                </button>
                            </div>
                            <h1 class="product__name">
                                <asp:Literal ID="lblProductName" runat="server"></asp:Literal></h1>
                            <asp:Image ID="imgBrandLogo" runat="server" />
                            <!--Product rating-->
                            <div class="product__description">
                                <asp:Literal ID="lblProductDescription" runat="server"></asp:Literal>
                            </div>
                            <!--Product features-->
                            <ul class="product__meta">
                                <li class="product__meta-availability">Dostupnost: 
                                    <%--<span class="text-success">Na stanju</span>--%>
                                    <asp:Label ID="lblAvailability" runat="server"></asp:Label>
                                </li>
                                <li>Proizvođač: <strong><a href="">
                                    <asp:Literal ID="lblBrandName" runat="server"></asp:Literal></a></strong></li>
                                <li>Šifra:
                                    <strong><asp:Literal ID="lblProductCode" runat="server"></asp:Literal></strong></li>
                            </ul>
                        </div>
                        <div class="product__sidebar">
                            <div class="product__availability">
                                Dostupnost: <%--<span class="text-success">Na stanju</span>--%>
                                <asp:Label ID="lblAvailability2" runat="server"></asp:Label>
                            </div>
                            <div class="product__prices" id="priceDiv" runat="server">
                                <div id="regularPriceDiv" runat="server">
                                    <asp:Literal ID="lblProductWebPrice" runat="server"></asp:Literal> <small>RSD</small>
                                </div>
                                <div id="promotionPriceDiv" runat="server" visible="false">
                                    <span class="product__new-price"><asp:Literal ID="lblPromotionPrice" runat="server"></asp:Literal> <small>RSD</small></span>
                                    <span class="product__old-price"><asp:Literal ID="lblOldPrice" runat="server"></asp:Literal> <small>RSD</small></span>
                                </div>
                            </div>
                            <div class="product__options" role="form">
                                <div class="form-group product__option">
                                    <label class="product__option-label" for="product-quantity">Količina</label>
                                    <div class="product__actions">
                                        <div class="product__actions-item">
                                            <div class="input-number product__quantity">
                                                <input id="product-quantity" class="input-number__input form-control form-control-lg" type="number" min="1" value="1" />
                                                <div class="input-number__add"></div>
                                                <div class="input-number__sub"></div>
                                            </div>
                                        </div>
                                        <div class="product__actions-item product__actions-item--addtocart">
                                            <button id="btnCart" runat="server" class="btn btn-primary btn-lg">Dodaj u korpu</button>
                                        </div>
                                        <div class="product__actions-item product__actions-item--wishlist">
                                            <button type="button" class="btn btn-secondary btn-svg-icon btn-lg" data-toggle="tooltip" title="Lista želja">
                                                <svg width="16px" height="16px">
                                                    <use xlink:href="/images/sprite.svg#wishlist-16"></use>
                                                </svg>
                                            </button>
                                        </div>
                                        <div class="product__actions-item product__actions-item--compare">
                                            <button type="button" class="btn btn-secondary btn-svg-icon btn-lg" data-toggle="tooltip" title="Uporedi">
                                                <svg width="16px" height="16px">
                                                    <use xlink:href="/images/sprite.svg#compare-16"></use>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="product-card__bottom-info bg-white mt-2">
                                <a href="/dostava-robe" target="_blank">
                                    <span id="spanDelivery" runat="server" class="fa fa-truck" data-toggle="tooltip" data-placement="top" title=""></span>
                                    <span id="spanInStore" runat="server" class="fa fa-home allowed" data-toggle="tooltip" data-placement="top" title="Preuzimanje u radnji"></span>
                                    <span id="spanInCity" runat="server" class="fa fa-city allowed" data-toggle="tooltip" data-placement="top" title="Dostava u Zrenjaninu"></span>
                                </a>
                            </div>
                        </div>
                        <div class="product__footer">
                            <div class="product__tags tags">
                                <%--<div class="tags__list">
                                    <a href="">Mounts</a>
                                    <a href="">Electrodes</a>
                                    <a href="">Chainsaws</a>
                                </div>--%>
                            </div>
                            <%--<div class="product__share-links share-links">
                                <ul class="share-links__list">
                                    <li class="share-links__item share-links__item--type--like"><a href="">Like</a></li>
                                    <li class="share-links__item share-links__item--type--tweet"><a href="">Tweet</a></li>
                                    <li class="share-links__item share-links__item--type--pin"><a href="">Pin It</a></li>
                                    <li class="share-links__item share-links__item--type--counter"><a href="">4K</a></li>
                                </ul>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="product-tabs">
                    <div class="product-tabs__list">
                        <a href="#tab-description" class="product-tabs__item product-tabs__item--active">Opis</a>
                        <a href="#tab-specification" class="product-tabs__item">Specifikacija</a>
                        <a href="#tab-declaration" class="product-tabs__item">Deklaracija</a>
                        <a href="#tab-reviews" class="product-tabs__item">Komentari</a>
                    </div>
                    <div class="product-tabs__content">
                        <div class="product-tabs__pane product-tabs__pane--active" id="tab-description">
                            <div class="typography">
                                <h3>Opis proizvoda</h3>
                                <p>
                                    <asp:Literal ID="lblProductDescriptionBottom" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </div>
                        <div class="product-tabs__pane" id="tab-specification">
                            <div class="spec">
                                <h3 class="spec__header">Specifikacija</h3>
                                <asp:Literal ID="lblProductSpecification" runat="server"></asp:Literal>
                            </div>
                        </div>
                        <div class="product-tabs__pane" id="tab-reviews">
                            <div class="reviews-view">

                            </div>
                        </div>
                        <div class="product-tabs__pane" id="tab-declaration">
                            <div class="typography">
                                <asp:Literal ID="lblDeclaration" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <Vivo:BlockProductsCarousel ID="productCarousel" runat="server" Type="Grid4" Title="Slični proizvodi" />
    </div>
    <Vivo:PhotoswipeContainer runat="server"></Vivo:PhotoswipeContainer>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
