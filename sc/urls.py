from django.conf.urls import patterns, include, url
from django.contrib import admin
from app.models import *
from app.views import *

admin.autodiscover()
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    ('^$', index),
    ('^index/$', index),

    ('^set_node/$', set_node),
    ('^set_prod/$', set_prod),
    ('^set_arc/$', set_arc),
    ('^set_resource/$', set_resource),
    ('^set_arcresource/$', set_arcresource),
    ('^set_nodeprod/$', set_nodeprod),
    ('^set_arcresourceprod/$', set_arcresourceprod),
    ('^set_resourceprod/$', set_resourceprod),

    ('^update_node/$', update_node),
    ('^update_prod/$', update_prod),
    ('^update_arc/$', update_arc),
    ('^update_resource/$', update_resource),
    ('^update_arcresource/$', update_arcresource),
    ('^update_nodeprod/$', update_nodeprod),
    ('^update_arcresourceprod/$', update_arcresourceprod),
    ('^update_resourceprod/$', update_resourceprod),

    ('^login_page/$', login_page),
    ('^login/$', login),
    ('^logout/$', logout),

    ('^confort/$', confort),
    ('^result/$', result),

    ('^add_ver/$', add_ver),

    # Examples:
    # url(r'^$', 'sc.views.home', name='home'),
    # url(r'^sc/', include('sc.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    #url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
