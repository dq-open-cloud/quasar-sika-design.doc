module.exports = {
  title: 'Hello VuePress',
  description: 'Just playing around',
  plugins: ['@vuepress/active-header-links', {
    sidebarLinkSelector: '.sidebar-link',
    headerAnchorSelector: '.header-anchor'
  }]
}