ba:
	flutter pub run build_runner build

bw: 
	rm -rf build/web
	flutter build web --pwa-strategy=none
	./move_assets.sh
