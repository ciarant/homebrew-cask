cask "nextcloud" do
  if MacOS.version <= :el_capitan
    version "2.6.5.20200710-legacy"
    sha256 "4c67e50361dd5596fb884002d1ed907fe109d607fba2cabe07e505addd164519"

    url "https://github.com/nextcloud/desktop/releases/download/v#{version.major_minor_patch}/Nextcloud-#{version}.pkg",
        verified: "github.com/nextcloud/desktop/"
  else
    version "3.1.0"
    sha256 "32df4c295328fb145ed44bd07c65da667331947a8e3eff60c22bed5b85f234ed"

    url "https://github.com/nextcloud/desktop/releases/download/v#{version}/Nextcloud-#{version}.pkg",
        verified: "github.com/nextcloud/desktop/"
  end

  appcast "https://github.com/nextcloud/desktop/releases.atom"
  name "Nextcloud"
  desc "Desktop sync client for Nextcloud software products"
  homepage "https://nextcloud.com/"

  depends_on macos: ">= :yosemite"

  pkg "Nextcloud-#{version}.pkg"
  binary "#{appdir}/nextcloud.app/Contents/MacOS/nextcloudcmd"

  uninstall pkgutil: "com.nextcloud.desktopclient"

  zap trash: [
    "~/Library/Application Scripts/com.nextcloud.desktopclient.FinderSyncExt",
    "~/Library/Application Support/Nextcloud",
    "~/Library/Caches/Nextcloud",
    "~/Library/Containers/com.nextcloud.desktopclient.FinderSyncExt",
    "~/Library/Group Containers/com.nextcloud.desktopclient",
    "~/Library/Preferences/com.nextcloud.desktopclient.plist",
    "~/Library/Preferences/Nextcloud",
  ]
end
