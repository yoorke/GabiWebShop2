<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="VivoShop.customControls.BlockProductsCarousel.Header" %>
<div class="block-header">
    <h3 class="block-header__title">
        <%--Izdvojeni proizvodi--%>
        <asp:Literal ID="lblTitle" runat="server"></asp:Literal>
    </h3>
    <div class="block-header__divider"></div>
<%--    <ul class="block-header__groups-list">
        <li>
            <button type="button" class="block-header__group  block-header__group--active ">All</button></li>
        <li>
            <button type="button" class="block-header__group ">Power Tools</button></li>
        <li>
            <button type="button" class="block-header__group ">Hand Tools</button></li>
        <li>
            <button type="button" class="block-header__group ">Plumbing</button></li>
    </ul>--%>
    <div class="block-header__arrows-list">
        <button class="block-header__arrow block-header__arrow--left" type="button">
            <svg width="7px" height="11px">
                <use xlink:href="/images/sprite.svg#arrow-rounded-left-7x11"></use>
            </svg>
        </button>
        <button class="block-header__arrow block-header__arrow--right" type="button">
            <svg width="7px" height="11px">
                <use xlink:href="/images/sprite.svg#arrow-rounded-right-7x11"></use>
            </svg>
        </button>
    </div>
</div>
