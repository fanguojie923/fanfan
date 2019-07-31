> composer require knplabs/knp-paginator-bundle

#####Add PaginatorBundle to your application kernel
// app/AppKernel.php

	public function registerBundles()
	{
	    return array(
	        // ...
	        new Knp\Bundle\PaginatorBundle\KnpPaginatorBundle(),
	        // ...
	    );
	}

#####Configuration example

	knp_paginator:
    page_range: 5                       # number of links showed in the pagination menu (e.g: you have 10 pages, a page_range of 3, on the 5th page you'll see links to page 4, 5, 6)
    default_options:                                 
        page_name: page                 # page query parameter name
        sort_field_name: sort           # sort field query parameter name
        sort_direction_name: direction  # sort direction query parameter name
        distinct: true                  # ensure distinct results, useful when ORM queries are using GROUP BY statements
        filter_field_name: filterField  # filter field query parameter name
        filter_value_name: filterValue  # filter value query parameter name
    template:                                        
        pagination: '@KnpPaginator/Pagination/sliding.html.twig'     # sliding pagination controls template         
        sortable: '@KnpPaginator/Pagination/sortable_link.html.twig' # sort link template                                
        filtration: '@KnpPaginator/Pagination/filtration.html.twig'  # filters template


#####Additional pagination templates
	That could be used out of the box in knp_paginator.template.pagination key:
	
	@KnpPaginator/Pagination/sliding.html.twig (by default)
	@KnpPaginator/Pagination/twitter_bootstrap_v4_pagination.html.twig
	@KnpPaginator/Pagination/twitter_bootstrap_v3_pagination.html.twig
	@KnpPaginator/Pagination/twitter_bootstrap_pagination.html.twig
	@KnpPaginator/Pagination/foundation_v5_pagination.html.twig
	@KnpPaginator/Pagination/bulma_pagination.html.twig
	@KnpPaginator/Pagination/semantic_ui_pagination.html.twig
	@KnpPaginator/Pagination/materialize_pagination.html.twig
#####Additional sortable templates
	
> That could be used out of the box in <strong>knp_paginator.template.sortable</strong>key:
	
	@KnpPaginator/Pagination/sortable_link.html.twig (by default)
	@KnpPaginator/Pagination/twitter_bootstrap_v3_sortable_link.html.twig
	@KnpPaginator/Pagination/font_awesome_sortable_link.html.twig

####Usage examples:
// Acme\MainBundle\Controller\ArticleController.php

	public function listAction(Request $request)
	{
	    $em    = $this->get('doctrine.orm.entity_manager');
	    $dql   = "SELECT a FROM AcmeMainBundle:Article a";
	    $query = $em->createQuery($dql);
	
	    $paginator  = $this->get('knp_paginator');
	    $pagination = $paginator->paginate(
	        $query, /* query NOT result */
	        $request->query->getInt('page', 1)/*page number*/,
	        10/*limit per page*/
	    );
	
	    // parameters to template
	    return $this->render('AcmeMainBundle:Article:list.html.twig', array('pagination' => $pagination));
	}

#####View

	{# total items count #}
	<div class="count">
	    {{ pagination.getTotalItemCount }}
	</div>
	<table>
	<tr>
	{# sorting of properties based on query components #}
	    <th>{{ knp_pagination_sortable(pagination, 'Id', 'a.id') }}</th>
	    <th{% if pagination.isSorted('a.Title') %} class="sorted"{% endif %}>{{ knp_pagination_sortable(pagination, 'Title', 'a.title') }}</th>
	    <th>{{ knp_pagination_sortable(pagination, 'Release', ['a.date', 'a.time']) }}</th>
	</tr>
	
	{# table body #}
	{% for article in pagination %}
	<tr {% if loop.index is odd %}class="color"{% endif %}>
	    <td>{{ article.id }}</td>
	    <td>{{ article.title }}</td>
	    <td>{{ article.date | date('Y-m-d') }}, {{ article.time | date('H:i:s') }}</td>
	</tr>
	{% endfor %}
	</table>
	{# display navigation #}
	<div class="navigation">
	    {{ knp_pagination_render(pagination) }}
	</div>