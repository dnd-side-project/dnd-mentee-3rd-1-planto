import * as bcrypt from "bcrypt";
import * as passport from "passport";
import { ExtractJwt, Strategy as JwtStrategy } from "passport-jwt";
import { Strategy as LocalStrategy } from "passport-local";
import { User } from "../src/entity/User";

export default () => {
  passport.use(
    new LocalStrategy(
      { usernameField: "email", passwordField: "password" },
      async (email, password, done) => {
        const user = await User.findOne({ where: { email } });
        const isAuth = await bcrypt.compare(password, user.password);

        if (!isAuth) {
          return done(null, false);
        }

        return done(null, user);
      }
    )
  );

  passport.use(
    new JwtStrategy(
      {
        jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
        secretOrKey: "test",
      },
      async (payload, done) => {
        const user = await User.findOne({ where: { id: payload.id } });

        if (!user) {
          return done(null, false);
        }

        return done(null, user);
      }
    )
  );
};
