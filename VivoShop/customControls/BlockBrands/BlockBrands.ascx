<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockBrands.ascx.cs" Inherits="VivoShop.customControls.BlockBrands.BlockBrands" %>
<div class="block block-brands">
    <div class="container">
        <div class="block-brands__slider">
            <div class="owl-carousel">
                <asp:Repeater ID="rptBrands" runat="server">
                    <ItemTemplate>
                        <div class="block-brands__item">
                            <asp:HyperLink runat="server" NavigateUrl='<%#Eval("Url") %>'>
                                <asp:Literal runat="server" Text='<%#Eval("Name") %>'></asp:Literal>
                                <asp:Image runat="server" ImageUrl='<%#Eval("LogoUrl") %>' />
                            </asp:HyperLink>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>