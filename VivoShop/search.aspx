<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="VivoShop.search" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/ProductControls/ProductCard/ProductCardControl.ascx" TagName="ProductCard" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" Title="Pretraga" />
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="block">
                        <div class="products-view">
                            <div class="products-view__options">

                            </div>
                            <div class="products-view__list products-list" data-layout="grid-4-full" data-with-features="false" data-mobile-grid-columns="2">
                                <div class="products-list__body">
                                    <asp:Repeater ID="rptProducts" runat="server">
                                        <HeaderTemplate>
                                            
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="products-list__item">
                                                <Vivo:ProductCard ID="productCard" runat="server" Product='<%#Container.DataItem %>'></Vivo:ProductCard>
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
