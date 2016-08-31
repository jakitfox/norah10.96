			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" style="text-align: center;">
				<p>&copy; <?php echo $config['site_title'];?>.
				<?php 
					echo 'Server date and clock is: '. getClock(false, true) .' Page generated in '. elapsedTime() .' seconds. Q: '.$aacQueries;
				?>
				<br/><b>Created by:</b> <a href="https://otland.net/members/ninja.83269/">Ninja</a>. <b>Converted to ZnoteAAC by:</b> <a href="https://otland.net/members/halfaway.142275/">HalfAway</a>.<br/>
				<b>Engine:</b> <a href="credits.php">Znote AAC</a></p>
			</div>
		</div>

		<script>var secondsToServerSave = <?php echo json_encode($remaining); ?>;</script>
		<script src="layout/js/bootstrap.min.js"></script>
		<script src="layout/js/jquery.countdown.min.js"></script>
		<script src="layout/js/misc.js"></script>
	</body>
</html>