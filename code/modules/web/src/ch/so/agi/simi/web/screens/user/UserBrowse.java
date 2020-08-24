package ch.so.agi.simi.web.screens.user;

import com.haulmont.cuba.gui.screen.*;
import ch.so.agi.simi.entity.iam.User;

@UiController("simi_User.browse")
@UiDescriptor("user-browse.xml")
@LookupComponent("usersTable")
@LoadDataBeforeShow
public class UserBrowse extends StandardLookup<User> {
}