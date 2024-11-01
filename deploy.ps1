# Add worktree for gh-pages branch
git worktree add ..\gh-pages gh-pages

# Build Flutter web app with the specified base href
flutter build web --base-href="/webapp_tests/"

# Copy the build output to the gh-pages worktree
xcopy /E /I /Y build\web\* ..\gh-pages

# Navigate to gh-pages worktree, commit, and push changes
cd ..\gh-pages
git add .
git commit -m "Update gh-pages with new assets"
git push origin gh-pages
cd ..\webapp_tests