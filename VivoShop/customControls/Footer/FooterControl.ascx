<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterControl.ascx.cs" Inherits="VivoShop.customControls.Footer.FooterControl" %>
<footer class="site__footer">
    <div class="site-footer">
        <div class="container">
            <div class="site-footer__widgets">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-4">
                        <div class="site-footer__widget footer-contacts">
                            <h5 class="footer-contacts__title">Kontaktirajte nas</h5>
                            <div class="footer-contacts__text text-justify">
                                <asp:Literal ID="lblCompanyDescription" runat="server"></asp:Literal>
                            </div>
                            <ul class="footer-contacts__contacts">
                                <li><i class="footer-contacts__icon fas fa-globe-americas"></i>
                                    <%--Hunjadi Janoša 33 23000 Zrenjanin--%>
                                    <asp:Literal ID="lblAddress" runat="server"></asp:Literal>
                                </li>
                                <li><i class="footer-contacts__icon far fa-envelope"></i>
                                    <%--info@gabi-boje.rs--%>
                                    <asp:Literal ID="lblEmail" runat="server"></asp:Literal>
                                </li>
                                <li><i class="footer-contacts__icon fas fa-mobile-alt"></i>
                                    <%--+381 (0) 23 527 184--%>
                                    <asp:Literal ID="lblPhone" runat="server"></asp:Literal>
                                </li>
                                <li><i class="footer-contacts__icon far fa-clock"></i>
                                    <%--Pon - Sub 08:00 - 19:00--%>
                                    <asp:Literal ID="lblWorkingHours" runat="server"></asp:Literal>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-6 col-md-3 col-lg-2">
                        <div class="site-footer__widget footer-links">
                            <h5 class="footer-links__title">Informacije</h5>
                            <asp:Repeater ID="rptPagesFooterLinks" runat="server">
                                <HeaderTemplate>
                                    <ul class="footer-links__list">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li class="footer-links__item">
                                        <asp:HyperLink runat="server" CssClass="footer-links__link" NavigateUrl='<%#"/" + Eval("url") %>' Text='<%#Eval("title") %>'></asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <li class="footer-links__item">
                                        <a class="footer-links__link" href="/kontakt">Kontakt</a>
                                    </li>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="col-6 col-md-3 col-lg-2">
                        <div class="site-footer__widget footer-links">
                            <h5 class="footer-links__title">Kupovina</h5>
                            <asp:Repeater ID="rptPagesFooterLinks2" runat="server">
                                <HeaderTemplate>
                                    <ul class="footer-links__list">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li class="footer-links__item">
                                        <asp:HyperLink runat="server" CssClass="footer-links__link" NavigateUrl='<%#"/" + Eval("url") %>' Text='<%#Eval("title") %>'></asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                                </asp:Repeater>
                            <h5 class="footer-links__title mt-4">My Account</h5>
                            <%--<asp:Repeater ID="rptAccountFooterLinks" runat="server">
                                <HeaderTemplate>
                                    <ul class="footer-links__list">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li class="footer-links__item">
                                        <asp:HyperLink runat="server" CssClass="footer-links__link" NavigateUrl='<%#Eval("url") %>' Text='<%#Eval("name") %>'></asp:HyperLink>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>--%>
                            <ul class="footer-links__list">
                                <li class="footer-links__item">
                                    <a href="/moj-nalog" class="footer-links__link">Moj nalog</a>
                                </li>
                                <li class="footer-links__item">
                                    <a href="/istorija-porucivanja" class="footer-links__link">Istorija poručivanja</a>
                                </li>
                                <li class="footer-links__item">
                                    <a href="/lista-zelja" class="footer-links__link">Lista želja</a>
                                </li>
                                <li class="footer-links__item">
                                    <a href="/akcija" class="footer-links__link">Akcije</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="site-footer__widget footer-newsletter">
                            <h5 class="footer-newsletter__title">Newsletter</h5>
                            <div class="footer-newsletter__text">
                                <%--Praesent pellentesque volutpat ex, vitae auctor lorem pulvinar mollis felis at lacinia.--%>
                                Pretplatite se na Gabi listu i saznajte prvi novosti vezane za proizvode i usluge.
                            </div>
                            <div action="" class="footer-newsletter__form">
                                <label class="sr-only" for="footer-newsletter-address">Email Address</label>
                                <input type="text" class="footer-newsletter__form-input form-control" id="footer-newsletter-address" placeholder="Email Address...">
                                <button class="footer-newsletter__form-button btn btn-primary">Subscribe</button>
                            </div>
                            <div class="footer-newsletter__text footer-newsletter__text--social">
                                Follow us on social networks
                            </div>
                            <ul class="footer-newsletter__social-links">
                                <li class="footer-newsletter__social-link footer-newsletter__social-link--facebook"><a href="https://themeforest.net/user/kos9" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                                <li class="footer-newsletter__social-link footer-newsletter__social-link--twitter"><a href="https://themeforest.net/user/kos9" target="_blank"><i class="fab fa-twitter"></i></a></li>
                                <li class="footer-newsletter__social-link footer-newsletter__social-link--youtube"><a href="https://themeforest.net/user/kos9" target="_blank"><i class="fab fa-youtube"></i></a></li>
                                <li class="footer-newsletter__social-link footer-newsletter__social-link--instagram"><a href="https://themeforest.net/user/kos9" target="_blank"><i class="fab fa-instagram"></i></a></li>
                                <li class="footer-newsletter__social-link footer-newsletter__social-link--rss"><a href="https://themeforest.net/user/kos9" target="_blank"><i class="fas fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site-footer__bottom">
                <div class="site-footer__copyright">
                    <%--Powered by HTML — Design by <a href="https://themeforest.net/user/kos9" target="_blank">Kos</a>--%>
                    Developed by VivoSoft
                </div>
                <div class="site-footer__payments">
                    <img src="/images/payments.png" alt="">
                </div>
            </div>
        </div>

        <div class="totop">
            <div class="totop__body">
                <div class="totop__start"></div>
                <div class="totop__container container"></div>
                <div class="totop__end">
                    <button type="button" class="totop__button">
                        <svg width="13px" height="8px">
                            <use xlink:href="/images/sprite.svg#arrow-rounded-up-13x8"></use>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</footer>
