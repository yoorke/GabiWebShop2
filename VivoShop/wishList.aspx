<%@ Page Title="" Language="C#" MasterPageFile="~/VivoShop.Master" AutoEventWireup="true" CodeBehind="wishList.aspx.cs" Inherits="VivoShop.wishList" %>
<%@ Register Src="~/customControls/Header/Desktop/DesktopHeader.ascx" TagName="DesktopHeader" TagPrefix="Vivo" %>
<%@ Register Src="~/customControls/PageHeaderControls/PageHeader.ascx" TagName="PageHeader" TagPrefix="Vivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <Vivo:DesktopHeader runat="server" IsHomepage="false" />

    <div class="site__body">
        <Vivo:PageHeader ID="pageHeader" runat="server" />
        <div class="block">
            <div class="container">
                <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound" OnItemCommand="rptProducts_ItemCommand">
                    <HeaderTemplate>
                        <table class="wishlist">
                            <thead class="wishlist__head">
                                <tr class="wishlist__row">
                                    <th class="wishlist__column wishlist__column--image">Slika</th>
                                    <th class="wishlist__column wishlist__column--product">Naziv</th>
                                    <th class="wishlist__column wishlist__column--price">Cena</th>
                                    <th class="wishlist__column wishlist__column--tocart"></th>
                                    <th class="wishlist__column wishlist__column--remove"></th>
                                </tr>
                            </thead>
                            <tbody class="wishlist__body">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="wishlist__row">
                            <asp:HiddenField ID="lblProductID" runat="server" Value='<%#Eval("productID") %>' />
                            <td class="wishlist__column wishlist__column--image">
                                <asp:HyperLink runat="server" NavigateUrl='<%#Eval("url") %>'>
                                    <asp:Image ID="imgProductImage" runat="server" ImageUrl='<%#Eval("images[0].ImageUrl") %>' />
                                </asp:HyperLink>
                            </td>
                            <td class="wishlist__column wishlist__column--product">
                                <asp:HyperLink runat="server" NavigateUrl='<%#Eval("url") %>'>
                                    <asp:Literal runat="server" Text='<%#Eval("FullName") %>'></asp:Literal>
                                </asp:HyperLink>
                            </td>
                            <td class="wishlist__column wishlist__column--price">
                                <asp:Literal runat="server" Text='<%#string.Format("{0:N2}", Eval("webPrice")) %>'></asp:Literal>
                            </td>
                            <td class="wishlist__column wishlist__column--tocart">
                                <%--<button id="btnAddToCart" runat="server" type="button" class="btn btn-primary btn-sm">U korpu</button>--%>
                                <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-sm" CommandName="AddToCart" CommandArgument='<%#Eval("ProductID") %>' Text="U korpu"></asp:LinkButton>
                            </td>
                            <td class="wishlist__column wishlist__column--remove">
                                <%--<button id="btnRemoveFromWishlist" runat="server" type="button" class="btn btn-light btn-sm btn-svg-icon">
                                    <svg width="12px" height="12px">
                                        <use xlink:href="images/sprite.svg#cross-12"></use>
                                    </svg>
                                </button> --%>
                                <asp:LinkButton ID="btnRemove" runat="server" OnClick="btnRemove_Click" CssClass="btn btn-light btn-sm btn-svg-icon" CommandName="Delete" CommandArgument='<%#Eval("ProductID") %>'>
                                    <svg width="12px" height="12px">
                                        <use xlink:href="images/sprite.svg#cross-12"></use>
                                    </svg>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                            </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContentPlaceholder" runat="server">
</asp:Content>
