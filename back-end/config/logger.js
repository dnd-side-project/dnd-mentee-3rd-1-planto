const { createLogger, config, format, transports } = require("winston");

const logger = createLogger({
  level: "info",
  // error, warn, info, http, verbose, debug, silly
  levels: config.npm.levels,
  format: format.combine(
    format.colorize(),
    format.timestamp({ format: "isoDateTime" }),
    format.printf(
      ({ level, message, timestamp }) =>
        `[${timestamp}][${level}] => ${message}`
    )
  ),
  transports: [
    new transports.File({
      filename: "error.log",
      dirname: "logs",
      level: "error",
      format: format.uncolorize(),
      handleExceptions: true,
    }),
    new transports.File({
      filename: "access.log",
      dirname: "logs",
      level: "info",
      format: format.uncolorize(),
    }),
    new transports.Console({
      level: "debug",
    }),
  ],
  exitOnError: false,
});

const stream = {
  write: (message) => {
    logger.log({
      level: "info",
      message: message.trim(),
    });
  },
};

module.exports = {
  logger,
  stream,
};
