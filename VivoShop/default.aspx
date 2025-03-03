<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="VivoShop._default" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/Slider/Slider.ascx" TagName="Slider" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockFeatures/BlockedFeatures.ascx" TagName="BlockFeatures" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockProductsCarousel/BlockProductsCarousel.ascx" TagName="BlockProductsCarousel" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BannerControls/BlockBanner.ascx" TagName="BlockBanner" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockProducts/BlockProducts.ascx" TagName="BlockProducts" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockCategories/BlockCategories.ascx" TagName="BlockCategories" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockProductsColumns/BlockProductsColumns.ascx" TagName="BlockProductsColumns" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/BlockBrands/BlockBrands.ascx" TagName="BlockBrands" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <Vivo:DesktopHeader runat="server" IsHomepage="true" />

    <div class="site__body">
        
        <Vivo:Slider runat="server" SliderID="1" ShowVerticalMenu="false"></Vivo:Slider>
        <Vivo:BlockFeatures runat="server"></Vivo:BlockFeatures>
        <Vivo:BlockProductsCarousel ID="blockProductsCarousel1" runat="server" NumberOfProducts="8" OrderByType="Random" Type="Grid4" Title="Izdvojeni proizvodi" CategoryID="10174" CacheData="false"></Vivo:BlockProductsCarousel>
        <Vivo:BlockBanner ID="banner1" runat="server" Position="FP5"></Vivo:BlockBanner>
        <Vivo:BlockProducts ID="blockProducts1" runat="server" NumberOfProducts="7" OrderByType="Order"></Vivo:BlockProducts>
        <Vivo:BlockCategories runat="server" />
        <Vivo:BlockProductsCarousel ID="blockProductsCarousel2" runat="server" NumberOfProducts="6" OrderByType="New" Type="Horizontal" Title="Novi proizvodi" ></Vivo:BlockProductsCarousel>
        <Vivo:BlockBrands runat="server" />
        <Vivo:BlockProductsColumns runat="server" />
    </div>
</asp:Content>
