﻿<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="VivoShop.products" %>

<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardControl.ascx" TagName="ProductCard" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/Pagination/Pagination.ascx" TagName="Pagination" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">

        <Vivo:PageHeader ID="pageHeader" runat="server" ShowTitle="true" />

        <div class="container">
            <div class="shop-layout shop-layout--sidebar--start">
                <div class="shop-layout__sidebar">
                </div>
                <div class="shop-layout__content">
                    <div class="block">
                        <div class="products-view">
                            <div class="products-view__options">
                                <div class="view-options view-options--offcanvas--mobile">
                                    <div class="view-options__filters-button">
                                        <button type="button" class="filters-button">
                                            <svg class="filters-button__icon" width="16px" height="16px">
                                                <use xlink:href="/images/sprite.svg#filters-16"></use>
                                            </svg>
                                            <span class="filters-button__title">Filters</span>
                                            <span class="filters-button__counter">3</span>
                                        </button>
                                    </div>
                                    <div class="view-options__layout">
                                        <div class="layout-switcher">
                                            <div class="layout-switcher__list">
                                                <button data-layout="grid-3-sidebar" data-with-features="false" title="Grid" type="button" class="layout-switcher__button  layout-switcher__button--active ">
                                                    <svg width="16px" height="16px">
                                                        <use xlink:href="/images/sprite.svg#layout-grid-16x16"></use>
                                                    </svg>
                                                </button>
                                                <button data-layout="grid-3-sidebar" data-with-features="true" title="Grid With Features" type="button" class="layout-switcher__button ">
                                                    <svg width="16px" height="16px">
                                                        <use xlink:href="/images/sprite.svg#layout-grid-with-details-16x16"></use>
                                                    </svg>
                                                </button>
                                                <button data-layout="list" data-with-features="false" title="List" type="button" class="layout-switcher__button ">
                                                    <svg width="16px" height="16px">
                                                        <use xlink:href="/images/sprite.svg#layout-list-16x16"></use>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="view-options__legend">
                                        <asp:Literal ID="lblProductsNumber" runat="server">Prikazano 100 od 100</asp:Literal></div>
                                    <div class="view-options__divider"></div>
                                    <div class="view-options__control">
                                        <label for="">Sortiraj</label>
                                        <div>
                                            <asp:DropDownList ID="cmbSort" runat="server" OnSelectedIndexChanged="cmbSort_SelectedIndexChanged" CssClass="form-control form-control-sm" EnableViewState="false"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="view-options__control">
                                        <label for="">Po stranici</label>
                                        <div>
                                            <asp:DropDownList ID="cmbPageSize" runat="server" OnSelectedIndexChanged="cmbPageSize_SelectedIndexChanged" CssClass="form-control form-control-sm" EnableViewState="false"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="products-view__list products-list" data-layout="grid-3-sidebar" data-with-features="false" data-mobile-grid-columns="2">
                                <div class="products-list__body">
                                    <asp:Repeater ID="rptProducts" runat="server" EnableViewState="false">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="products-list__item">
                                                <Vivo:ProductCard ID="productCard" runat="server" Product="<%#Container.DataItem %>" /> 
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>


                            <div class="products-view__pagination">
                                <Vivo:Pagination ID="pgrPagination" runat="server" />
                                <asp:HiddenField ID="lblPageIndex" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
    <script src="/js.src/products-page.js" type="text/javascript"></script>
</asp:Content>
