<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockCategories.ascx.cs" Inherits="VivoShop.customControls.BlockCategories.BlockCategories" %>
<%@ Register Src="~/customControls/BlockCategories/BlockCategoriesListItem.ascx" TagName="BlockCategoriesListItem" TagPrefix="Vivo" %>

<div class="block block--highlighted block-categories block-categories--layout--classic">
    <div class="container">
        <div class="block-header">
            <h3 class="block-header__title">Izdvojene kategorije</h3>
            <div class="block-header__divider"></div>
        </div>
        <asp:Repeater ID="rptCategories" runat="server">
            <HeaderTemplate>
                <div class="block-categories__list">
            </HeaderTemplate>
            <ItemTemplate>
                <Vivo:BlockCategoriesListItem runat="server" Category="<%#Container.DataItem %>"></Vivo:BlockCategoriesListItem>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
