<?php if(!empty($product_data)){ ?>

<?php if($show_slider){ $row = $num_row; $sliderclass = 'slider'; }else {$row = 1; $sliderclass = 'nslider';} ?>
<?php (!empty($product_data['mainproduct']))? $prolarge = 'prolarge': $prolarge = 'nprolarge'; ?>
<?php (!empty($column))?$class_css = '.bt-column':$class_css = 'bt-'.$prolarge.'-'.$sliderclass; ?>

<div class="bt-featured-pro <?php echo $class_css; ?>" >
	<div class="box-heading title"><h1><?php echo $title; ?></h1></div>
	<div class="box-content bt-product-content">
	<?php if(!empty($product_data['mainproduct'])){ ?>
	<?php $mainproduct = $product_data['mainproduct'];?>
		<div class="bt-product-large">
		<section class="bt-item-large product-thumb">
			<?php if ($images) { ?>
			<ul id="boss-big-product">
				<?php foreach ($images as $image) { ?>
				<li class="image image-item"><a class="thumbnail" href="<?php echo $mainproduct['href']; ?>" title="<?php echo $mainproduct['name']; ?>"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $mainproduct['name']; ?>" alt="<?php echo $mainproduct['name']; ?>" /></a></li>
				<?php } ?>
			</ul>
			<?php } ?>
			  <a id="prev_big_product_<?php echo $module; ?>" class="prev nav_thumb" href="javascript:void(0)" title="prev"><i class="fa fa-angle-left"></i></a>
			  <a id="next_big_product_<?php echo $module; ?>" class="next nav_thumb" href="javascript:void(0)" title="next"><i class="fa fa-angle-right"></i></a>
			<div class="small_detail">			
				<div class="name"><a href="<?php echo $mainproduct['href']; ?>"><?php echo $mainproduct['name']; ?></a></div>
				<p class="description"><?php //echo $mainproduct['description']; ?></p>
				<?php if ($mainproduct['rating']) { ?>
				<div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
				  <?php if ($mainproduct['rating'] < $i) { ?>
				  <span class="fa fa-stack fa-hidden"><i class="fa fa-star fa-stack-2x"></i></span>
				  <?php } else { ?>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				  <?php } ?>
				  <?php } ?>
				</div>
				<?php } ?>
				<?php if ($mainproduct['price']) { ?>
				<p class="price">
				  <?php if (!$mainproduct['special']) { ?>
				  <?php echo $mainproduct['price']; ?>
				  <?php } else { ?>
				  <span class="price-old"><?php echo $mainproduct['price']; ?></span>
				  <span class="price-new"><?php echo $mainproduct['special']; ?></span>
				  <?php } ?>
				</p>
				<?php } ?>
			
			</div>
			<div class="button-group">
				<button class="btn-cart" type="button" onclick="btadd.cart('<?php echo $mainproduct['product_id']; ?>','<?php echo $mainproduct['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
				<button class="btn-wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $mainproduct['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				<button class="btn-compare" type="button" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $mainproduct['product_id']; ?>');"><i class="fa fa-retweet"></i></button>
			</div>
		</section>
		</div>
	<?php } ?>
	
	<?php if(!empty($product_data['products'])){ ?>
	<?php $products = $product_data['products'];?>
	<?php //echo '<pre>'; print_r($products);die();echo '</pre>';?>
	<div class="bt-items bt-product-grid">
		<div id="boss_featured_<?php echo $module; ?>">
			<?php $i = 0; ?>
			<?php $class="even";?>
			<?php foreach($products as $product){ ?>
			<?php $class=="odd"?$class="even":$class="odd"; ?>
			<?php if(($i%$row)==0){ ?>
			 <div class="bt-item-extra product-layout <?php echo $class; ?> element-<?php echo $per_row; ?>">
			<?php } ?>
			<?php $i++; ?>
			<section class="product-thumb bt-item transition">
				<?php if ($product['thumb']) { ?>
				<div class="image">
				  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
				  <div class="button-group button-grid">
					<button class="btn-cart" type="button" onclick="btadd.cart('<?php echo $product['product_id']; ?>','<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i></button>
					<button class="btn-wishlist" type="button" title="<?php echo $button_wishlist; ?>" onclick="btadd.wishlist('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
					<button class="btn-compare" type="button" title="<?php echo $button_compare; ?>" onclick="btadd.compare('<?php echo $product['product_id']; ?>');"><i class="fa fa-retweet"></i></button>
				  </div>
				</div>
				<?php } ?>
			
				<div class="small_detail">
					<div class="caption">
						<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						
						<?php if ($product['rating']) { ?>
						<div class="rating">
						  <?php for ($i = 1; $i <= 5; $i++) { ?>
						  <?php if ($product['rating'] < $i) { ?>
						  <span class="fa fa-stack fa-hidden"><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
						  <?php } ?>
						  <?php } ?>
						</div>
						<?php } ?>
						<?php if ($product['price']) { ?>
						<p class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-old"><?php echo $product['price']; ?></span>
						  <span class="price-new"><?php echo $product['special']; ?></span>
						  <?php } ?>
						</p>
						<?php } ?>
					</div>
				</div>
				
			</section>
			<?php if((($i%$row)==0)||($i==count($products))){ ?> </div> <?php } ?>
			<?php } ?>
		</div>
		<div class="clearfix"></div>
		<?php if($show_slider){ ?>
			<a id="prev_featured_<?php echo $module; ?>" class="prev nav_thumb" href="javascript:void(0)" title="prev"><i class="fa fa-angle-left"></i></a>
			<a id="next_featured_<?php echo $module; ?>" class="next nav_thumb" href="javascript:void(0)" title="next"><i class="fa fa-angle-right"></i></a>
			<?php if($nav_type){ ?>
			<div id="bt_pag_<?php echo $module; ?>" class="bt-pag"></div>
			<?php } ?>
		<?php } ?>
	</div>
	<?php } ?>
</div>
<?php if($show_slider){ ?>
<script type="text/javascript"><!--
$(window).load(function(){
	//var image_width = <?php echo $image_width; ?>;
	if ($(window).width() > 768) {
		var image_width = <?php echo $image_width; ?>;
	}else{
		var image_width = 300;
	}
    $('#boss_featured_<?php echo $module; ?>').carouFredSel({
        auto: {
			play: false,
			timeoutDuration: 3000,
		},
        responsive: true,
        width: '100%',
		height: 'variable',
        prev: '#prev_featured_<?php echo $module; ?>',
        next: '#next_featured_<?php echo $module; ?>',
		pagination: '#bt_pag_<?php echo $module; ?>',
        swipe: {
        onTouch : true
        },
        items: {
            width: image_width,
            height: 'variable',
            visible: {
				min: 1,
				max: <?php echo $per_row; ?>
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        },
    });
	
});
//--></script>
<?php } ?>
<script type="text/javascript"><!--
$(window).load(function(){
	//var image_width = <?php echo $image_width; ?>;
	if ($(window).width() > 768) {
		var image_width = <?php echo $image_width; ?>;
	}else{
		var image_width = 300;
	}
	$('#boss-big-product').carouFredSel({
        auto: {
			play: false,
			timeoutDuration: 4200,
		},
        responsive: true,
        width: '100%',
		height: 'variable',
        prev: '#prev_big_product_<?php echo $module; ?>',
        next: '#next_big_product_<?php echo $module; ?>',
        swipe: {
        onTouch : true
        },
        items: {
            width: image_width,
            height: 'variable',
            visible: {
				min: 1,
				max: 1
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1100,   //  The duration of the transition.
			item: 1
        },
		
    });
	
});
//--></script>
</div>
<?php } ?>

